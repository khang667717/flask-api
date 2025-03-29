from flask import Flask, request, jsonify, render_template,request, redirect, url_for, session, jsonify
from werkzeug.security import check_password_hash
import mysql.connector
import os
import re
import pymysql
from dotenv import load_dotenv
import time


from flask_cors import CORS  # Import flask_cors

load_dotenv()

app = Flask(__name__)
app.secret_key = "1113"
CORS(app) 
CORS(app, resources={r"/*": {"origins": "http://127.0.0.1:5500"}})


# Kết nối MySQL
MYSQL_HOST = "yamanote.proxy.rlwy.net"
MYSQL_USER = "root"
MYSQL_PASSWORD = "wTejdYhgNEchXKdbBdmAjBFxvOZrVAhy"
MYSQL_DB = "railway"
MYSQL_PORT = 21772  # Railway cấp port riêng

db = pymysql.connect(
    host=MYSQL_HOST,
    user=MYSQL_USER,
    password=MYSQL_PASSWORD,
    database=MYSQL_DB,
    port=MYSQL_PORT
)
cursor = db.cursor()

def handle_upgrade_downgrade(user_message):
    try:
        # Xác định hành động (nâng cấp hoặc hạ cấp) dựa trên sự so sánh dung lượng RAM
        action = None
        current_ram = 16  # Giả sử RAM hiện tại là 16GB, có thể lấy từ cơ sở dữ liệu nếu cần
        
        # Tìm dung lượng RAM mong muốn
        ram_match = re.search(r'(\d+GB)', user_message)
        desired_ram = ram_match.group(0) if ram_match else None

        # Nếu không tìm thấy dung lượng RAM mong muốn trong câu, trả về thông báo lỗi
        if not desired_ram:
            return "Xin lỗi, tôi không thể xác định dung lượng RAM bạn muốn."

        # Chuyển đổi desired_ram thành dạng đầy đủ, ví dụ "8GB" thành "8GB RAM"
        desired_ram_full = f"{desired_ram} RAM"
        
        # Tìm tên laptop
        match = re.search(r'(MacBook Air M2|MacBook Pro|Dell XPS 13|Asus ROG Zephyrus G14|HP|Lenovo)', user_message, re.IGNORECASE)
        laptop_name = match.group(0) if match else None
        print(f"Laptop detected: {laptop_name}")  # Debug log

        if not laptop_name:
            return "Xin lỗi, tôi không xác định được tên laptop của bạn. Hãy nhập chính xác."

        print(f"🔍 Tìm laptop: {laptop_name}")  # Debug log

        # Lấy laptop_id từ database
        cursor.execute("SELECT id, brand, price, specifications, image_url FROM laptops WHERE name LIKE %s", (f"%{laptop_name}%",))
        laptop_info_result = cursor.fetchone()

        if not laptop_info_result:
            return f"Xin lỗi, tôi không tìm thấy thông tin cho {laptop_name}."

        laptop_id, brand, price, specifications, image_url = laptop_info_result
        print(f"Laptop ID: {laptop_id}")  # Debug log

        # Truy vấn các tùy chọn nâng cấp RAM cho laptop này
        cursor.execute("SELECT component_name, price_change FROM upgrades WHERE laptop_id = %s AND component_type = 'RAM'", (laptop_id,))
        upgrades = cursor.fetchall()

        if not upgrades:
            return f"Hiện tại không có tùy chọn {action} RAM nào cho {laptop_name}."

        # Danh sách RAM có sẵn
        available_ram = {comp_name: price_change for comp_name, price_change in upgrades}
        print(f"Available RAM: {available_ram}")  # Debug log

        # Kiểm tra hành động nâng cấp hay hạ cấp
        desired_ram_value = int(desired_ram.split('GB')[0])  # Lấy số GB từ desired_ram (ví dụ: 32 từ "32GB")
        
        if desired_ram_value > current_ram:
            action = "nâng cấp"
        elif desired_ram_value < current_ram:
            action = "hạ cấp"
        else:
            action = "giữ nguyên"  # Trường hợp không thay đổi RAM

        # Thay "lên" thành "xuống" khi hạ cấp
        direction = "lên" if action != "hạ cấp" else "xuống"

        # Kiểm tra nếu RAM mong muốn có trong danh sách
        if desired_ram_full in available_ram:
            price_change = available_ram[desired_ram_full]
            response = f"Bạn có thể {action} RAM của {laptop_name} {direction} {desired_ram} với giá {price_change}$.\n"
            response += f"Thông tin laptop:\nHãng: {brand}, Giá: {price}$, Thông số: {specifications}, Hình ảnh: {image_url}"
        else:
            # Nếu không có trong danh sách, hiển thị thông báo rõ ràng
            response = f"{laptop_name} không hỗ trợ {desired_ram} RAM. Các tùy chọn có sẵn là:\n" + \
                       "\n".join([f"{ram} (Thay đổi giá: {price}$)" for ram, price in available_ram.items()])

        return response

    except Exception as e:
        return f"Lỗi khi xử lý yêu cầu {action}: {str(e)}"

# Test chức năng với một câu lệnh ví dụ
user_message = "Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB."
response = handle_upgrade_downgrade(user_message)
print(response)


def handle_upgrade_downgrade_cpu(user_message):
    try:
        # Xác định hành động (nâng cấp hoặc hạ cấp) dựa trên sự so sánh CPU
        action = None
        current_cpu = "Intel i7"  # Giả sử CPU hiện tại là Intel i7, có thể lấy từ cơ sở dữ liệu nếu cần
        
        # Tìm CPU mong muốn
        cpu_match = re.search(r'(Intel i3|Intel i5|Intel i7|-\d+|AMD Ryzen \d+)', user_message)
        desired_cpu = cpu_match.group(0) if cpu_match else None

        if not desired_cpu:
            return "Xin lỗi, tôi không thể xác định CPU bạn muốn."

        # Tìm tên laptop
        match = re.search(r'(MacBook Air M2|MacBook Pro|Dell XPS 13|Asus ROG Zephyrus G14|HP|Lenovo)', user_message, re.IGNORECASE)
        laptop_name = match.group(0) if match else None
        print(f"Laptop detected: {laptop_name}")  # Debug log

        if not laptop_name:
            return "Xin lỗi, tôi không xác định được tên laptop của bạn. Hãy nhập chính xác."

        print(f"🔍 Tìm laptop: {laptop_name}")

        # Lấy laptop_id từ database
        cursor.execute("SELECT id, brand, price, specifications, image_url FROM laptops WHERE name LIKE %s", (f"%{laptop_name}%",))
        laptop_info_result = cursor.fetchone()

        if not laptop_info_result:
            return f"Xin lỗi, tôi không tìm thấy thông tin cho {laptop_name}."

        laptop_id, brand, price, specifications, image_url = laptop_info_result
        print(f"Laptop ID: {laptop_id}")
        # Truy vấn các tùy chọn nâng cấp CPU cho laptop này
        cursor.execute("SELECT component_name, price_change FROM upgrades WHERE laptop_id = %s AND component_type = 'CPU'", (laptop_id,))
        upgrades = cursor.fetchall()

        if not upgrades:
            return f"Hiện tại không có tùy chọn nâng cấp CPU nào cho {laptop_name}."

        # Danh sách CPU có sẵn
        available_cpu = {comp_name: price_change for comp_name, price_change in upgrades}

        # Kiểm tra hành động nâng cấp hay hạ cấp
        if desired_cpu in available_cpu:
            price_change = available_cpu[desired_cpu]
            response = f"Bạn có thể nâng cấp CPU của {laptop_name} lên {desired_cpu} với giá {price_change}$.\n"
            response += f"Thông tin laptop:\nHãng: {brand}, Giá: {price}$, Thông số: {specifications}, Hình ảnh: {image_url}"
        else:
            # Nếu không có trong danh sách, hiển thị thông báo rõ ràng
            response = f"{laptop_name} không hỗ trợ {desired_cpu} CPU. Các tùy chọn có sẵn là:\n" + \
                       "\n".join([f"{cpu} (Thay đổi giá: {price}$)" for cpu, price in available_cpu.items()])

        return response

    except Exception as e:
        return f"Lỗi khi xử lý yêu cầu CPU: {str(e)}"
    
# Test chức năng với một câu lệnh ví dụ

user_message = "Hạ cấp CPU Dell XPS 13 xuống Intel i5."
response = handle_upgrade_downgrade_cpu(user_message)
print(response)

import re

def handle_upgrade_downgrade_gpu(user_message):
    try:
        # Xác định hành động (nâng cấp hoặc hạ cấp) dựa trên sự so sánh GPU
        action = None
        current_gpu = "RTX 3050"  # Giả sử GPU hiện tại là NVIDIA GTX 1660 Ti, có thể lấy từ cơ sở dữ liệu nếu cần
        
        # Tìm GPU mong muốn (sửa regex để không yêu cầu số phía sau)
        gpu_match = re.search(r'(RTX 3050|RTX 3060|RTX 3070)', user_message)
        desired_gpu = gpu_match.group(0) if gpu_match else None

        if not desired_gpu:
            return "Xin lỗi, tôi không thể xác định GPU bạn muốn."

        # Tìm tên laptop
        match = re.search(r'(MacBook Air M2|MacBook Pro|Dell XPS 13|Asus ROG Zephyrus G15|MacBook Air M3|Asus ROG Zephyrus G11|MacBook Air M4|MacBook Air Pro M3|Lenovo)', user_message, re.IGNORECASE)
        laptop_name = match.group(0) if match else None

        if not laptop_name:
            return "Xin lỗi, tôi không xác định được tên laptop của bạn. Hãy nhập chính xác."

        # Lấy laptop_id từ database
        cursor.execute("SELECT id, brand, price, specifications, image_url FROM laptops WHERE name LIKE %s", (f"%{laptop_name}%",))
        laptop_info_result = cursor.fetchone()

        if not laptop_info_result:
            return f"Xin lỗi, tôi không tìm thấy thông tin cho {laptop_name}."

        laptop_id, brand, price, specifications, image_url = laptop_info_result
        print(f"Laptop ID: {laptop_id}")

        # Truy vấn các tùy chọn nâng cấp GPU cho laptop này
        cursor.execute("SELECT component_name, price_change FROM upgrades WHERE laptop_id = %s AND component_type = 'GPU'", (laptop_id,))
        upgrades = cursor.fetchall()

        if not upgrades:
            return f"Hiện tại không có tùy chọn nâng cấp GPU nào cho {laptop_name}."

        # Danh sách GPU có sẵn
        available_gpu = {comp_name: price_change for comp_name, price_change in upgrades}

        if desired_gpu in available_gpu:
            price_change = available_gpu[desired_gpu]
            response = f"Bạn có thể nâng cấp GPU của {laptop_name} lên {desired_gpu} với giá {price_change}$.\n"
            response += f"Thông tin laptop:\nHãng: {brand}, Giá: {price}$, Thông số: {specifications}, Hình ảnh: {image_url}"
        else:
            response = f"{laptop_name} không hỗ trợ {desired_gpu} GPU. Các tùy chọn có sẵn là:\n" + \
                       "\n".join([f"{gpu} (Thay đổi giá: {price}$)" for gpu, price in available_gpu.items()])

        return response

    except Exception as e:
        return f"Lỗi khi xử lý yêu cầu GPU: {str(e)}"

# Test chức năng với một câu lệnh ví dụ
user_message = "Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050."
response = handle_upgrade_downgrade_gpu(user_message)
print(response)


def handle_upgrade_downgrade_ssd(user_message):
    try:
        # Xác định hành động (nâng cấp hoặc hạ cấp) dựa trên sự so sánh SSD
        action = None
        current_ssd = 512  # Giả sử SSD hiện tại là 512GB, có thể lấy từ cơ sở dữ liệu nếu cần
        
        # Tìm dung lượng SSD mong muốn
        ssd_match = re.search(r'(\d+GB)', user_message)
        desired_ssd = ssd_match.group(0) if ssd_match else None

        if not desired_ssd:
            return "Xin lỗi, tôi không thể xác định dung lượng SSD bạn muốn."

        # Chuyển đổi desired_ssd thành dạng đầy đủ, ví dụ "256GB SSD" thành "256GB SSD"
        desired_ssd_full = desired_ssd

        # Tìm tên laptop
        match = re.search(r'(MacBook Air M2|MacBook Pro|Dell XPS 13|Asus ROG Zephyrus G14|HP|Lenovo)', user_message, re.IGNORECASE)
        laptop_name = match.group(0) if match else None

        if not laptop_name:
            return "Xin lỗi, tôi không xác định được tên laptop của bạn. Hãy nhập chính xác."

        # Lấy laptop_id từ database
        cursor.execute("SELECT id, brand, price, specifications, image_url FROM laptops WHERE name LIKE %s", (f"%{laptop_name}%",))
        laptop_info_result = cursor.fetchone()

        if not laptop_info_result:
            return f"Xin lỗi, tôi không tìm thấy thông tin cho {laptop_name}."

        laptop_id, brand, price, specifications, image_url = laptop_info_result
        print(f"Laptop ID: {laptop_id}")

        # Truy vấn các tùy chọn nâng cấp SSD cho laptop này
        cursor.execute("SELECT component_name, price_change FROM upgrades WHERE laptop_id = %s AND component_type = 'SSD'", (laptop_id,))
        upgrades = cursor.fetchall()

        if not upgrades:
            return f"Hiện tại không có tùy chọn nâng cấp SSD nào cho {laptop_name}."

        # Danh sách SSD có sẵn
        available_ssd = {comp_name: price_change for comp_name, price_change in upgrades}

        # Kiểm tra hành động nâng cấp hay hạ cấp
        desired_ssd_value = int(desired_ssd.split('GB')[0])  # Lấy số GB từ desired_ssd (ví dụ: 256 từ "256GB SSD")
        
        if desired_ssd_value > current_ssd:
            action = "nâng cấp"
        elif desired_ssd_value < current_ssd:
            action = "hạ cấp"
        else:
            action = "giữ nguyên"  # Trường hợp không thay đổi SSD

        # Thay "lên" thành "xuống" khi hạ cấp
        direction = "lên" if action != "hạ cấp" else "xuống"

        # Kiểm tra nếu SSD mong muốn có trong danh sách
        if desired_ssd_full in available_ssd:
            price_change = available_ssd[desired_ssd_full]
            response = f"Bạn có thể {action} SSD của {laptop_name} {direction} {desired_ssd} với giá {price_change}$.\n"
            response += f"Thông tin laptop:\nHãng: {brand}, Giá: {price}$, Thông số: {specifications}, Hình ảnh: {image_url}"
        else:
            response = f"{laptop_name} không hỗ trợ {desired_ssd} SSD. Các tùy chọn có sẵn là:\n" + \
                       "\n".join([f"{ssd} (Thay đổi giá: {price}$)" for ssd, price in available_ssd.items()])

        return response

    except Exception as e:
        return f"Lỗi khi xử lý yêu cầu SSD: {str(e)}"
    
# Test chức năng với một câu lệnh ví dụ

user_message = "Hạ cấp SSD Dell XPS 13 xuống 256GB."
response = handle_upgrade_downgrade_ssd(user_message)
print(response)

# API xử lý chat với AI
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg', 'gif'}

@app.route('/chat', methods=['POST'])
def chat():
    try:
        data = request.get_json()
        if not data or "message" not in data:
            return jsonify({"error": "Invalid request"}), 400

        user_message = data["message"]

        # 🔍 Lấy danh sách tất cả laptop từ database
        cursor.execute("SELECT name FROM laptops")
        all_laptops = [row[0] for row in cursor.fetchall()]

        exact_laptop_name = None
        for laptop in all_laptops:
            if laptop.lower() in user_message.lower():
                exact_laptop_name = laptop
                break

        # 🔹 Kiểm tra có phải câu hỏi về nâng cấp không?
        is_upgrade_request = any(keyword in user_message.lower() for keyword in ["nâng cấp", "hạ cấp"])

        if exact_laptop_name and not is_upgrade_request:
            # 🖥 Nếu nhập chính xác model laptop -> lấy thông tin laptop
            cursor.execute("SELECT name, brand, price, specifications, image_url FROM laptops WHERE name = %s", (exact_laptop_name,))
            laptop = cursor.fetchone()

            if laptop:
                name, brand, price, specifications, image_url = laptop
                response_text = f"📌 **{name}**\n Hãng: {brand}\n Giá: {price}$\n Thông số: {specifications}\n 🖼 Hình ảnh: {image_url}"
            else:
                response_text = "Xin lỗi, tôi không tìm thấy thông tin về laptop này."

        elif not exact_laptop_name and not is_upgrade_request:
            # 🔹 Nếu chỉ nhập thương hiệu (VD: MacBook) -> trả về danh sách laptop cùng thương hiệu
            brand = None
            for b in ["MacBook", "Dell", "Asus", "HP", "Lenovo"]:
                if b.lower() in user_message.lower():
                    brand = b
                    break

            if brand:
                cursor.execute("SELECT name, brand, price, specifications, image_url FROM laptops WHERE brand LIKE %s", (f"%{brand}%",))
                results = cursor.fetchall()

                if results:
                    laptop_list = [f"📌 **{row[0]}**\n Giá: {row[2]}$\n Thông số: {row[3]}\n 🖼 Hình ảnh: {row[4]}" for row in results]
                    response_text = "\n\n".join(laptop_list)
                else:
                    response_text = f"Xin lỗi, tôi không tìm thấy laptop nào thuộc thương hiệu {brand}."
            else:
                response_text = "Xin lỗi, tôi không nhận diện được laptop bạn muốn tìm."

        elif exact_laptop_name and is_upgrade_request:
            # 🔧 Xử lý nâng cấp phần cứng
            cursor.execute("SELECT id FROM laptops WHERE name = %s", (exact_laptop_name,))
            laptop_id_result = cursor.fetchone()

            if not laptop_id_result:
                return jsonify({"response": "Không tìm thấy laptop để nâng cấp."})

            laptop_id = laptop_id_result[0]

            # 🔎 Tìm phần cứng muốn nâng cấp
            components_regex = {
                "RAM": r'(RAM\s*\d+GB|\d+GB\s*RAM)',
                "GPU": r'(RTX \d{3,4}|GTX \d{3,4}|Intel UHD Graphics)',
                "CPU": r'(Intel \w+\d+|AMD \w+\d+|Ryzen \d+|Apple M[1-3])',
                "SSD": r'(\d+\s*(GB|TB)\s*SSD?)',
            }

            components_info = {}

            for component, pattern in components_regex.items():
                component_match = re.search(pattern, user_message, re.IGNORECASE)
                if component_match:
                    desired_component = component_match.group(0).strip().lower()

                    # Tìm linh kiện tương ứng
                    cursor.execute("SELECT component_name, price_change FROM upgrades WHERE laptop_id = %s AND component_type = %s", 
                                   (laptop_id, component))
                    upgrades = cursor.fetchall()

                    available_components = {comp_name.strip().lower(): price_change for comp_name, price_change in upgrades}

                    if desired_component in available_components:
                        price_change = available_components[desired_component]
                        if price_change > 0:
                            components_info[component] = f"✅ Bạn có thể **nâng cấp** {component} lên {desired_component.upper()} với giá {price_change}$."
                        elif price_change < 0:
                            components_info[component] = f"❎ Bạn có thể **hạ cấp** {component} xuống {desired_component.upper()} và tiết kiệm {abs(price_change)}$."
                        else:
                            components_info[component] = f"ℹ️ {exact_laptop_name} đã có {desired_component.upper()}, không có thay đổi về giá."
                    else:
                        available_options = "\n".join([f"- {comp.upper()} (Thay đổi giá: {price}$)" for comp, price in available_components.items()])
                        components_info[component] = f"⚠️ {exact_laptop_name} không hỗ trợ {desired_component.upper()}.\n Các tùy chọn {component} có sẵn:\n{available_options}"

            # 🎯 Kết hợp thông tin nâng cấp
            response_text = f"📌 **{exact_laptop_name}** - Nâng cấp phần cứng:\n"
            for component, info in components_info.items():
                response_text += f"{info}\n"

        else:
            response_text = "Xin lỗi, tôi không thể hiểu yêu cầu của bạn."

        # 📝 Lưu lịch sử hội thoại vào database
        if "user_id" in data:
            cursor.execute("INSERT INTO chatbot_history (user_id, message, response) VALUES (%s, %s, %s)", 
                           (data["user_id"], user_message, response_text))
        else:
            cursor.execute("INSERT INTO chatbot_history (message, response) VALUES (%s, %s)", 
                           (user_message, response_text))
        db.commit()

        return jsonify({"response": response_text})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
# Kiểm tra file upload có hợp lệ không
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS']

# API lấy lịch sử hội thoại
@app.route('/history', methods=['GET'])
def get_history():
    cursor.execute("SELECT message, response FROM chatbot_history ORDER BY id DESC LIMIT 10")
    history = cursor.fetchall()
    history_list = [{"message": msg, "response": resp} for msg, resp in history]
    return jsonify({"history": history_list}) 

# Trang chủ (Chatbot)
@app.route('/')
def index():
    return render_template('index.html')

@app.route("/test_db")
def test_db():
    try:
        cursor.execute("SELECT DATABASE()")
        db_name = cursor.fetchone()
        return jsonify({"message": "Kết nối MySQL thành công!", "database": db_name[0]})
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
# Trang Admin
@app.route('/admin')
def admin():
    # Thay vì kiểm tra đăng nhập, người dùng sẽ trực tiếp vào trang admin
    return render_template('admin.html')
    

# API thêm laptop
# API lấy danh sách laptop
@app.route('/get_laptops', methods=['GET'])
def get_laptops():
    cursor.execute("SELECT * FROM laptops")
    laptops = cursor.fetchall()

    laptop_list = [
        {
            "id": laptop[0],
            "name": laptop[1],
            "brand": laptop[2],
            "price": laptop[3],
            "specifications": laptop[4],
            "image_url": f"http://localhost:5000/static/images/{os.path.basename(laptop[5])}" if laptop[5] else None
        }
        for laptop in laptops
    ]

    print(laptop_list)  # Kiểm tra dữ liệu
    return jsonify({"laptops": laptop_list})

# API thêm laptop
@app.route('/add_laptop', methods=['POST'])
def add_laptop():
    data = request.form
    name = data.get('name')
    brand = data.get('brand')
    price = data.get('price')
    specifications = data.get('specifications')
    image_url = request.files.get('image_url')

    image_filename = None  # Mặc định không có ảnh

    if image_url:
        allowed_extensions = {"png", "jpg", "jpeg"}
        ext = image_url.filename.split('.')[-1].lower()
        if ext not in allowed_extensions:
            return jsonify({"error": "Chỉ hỗ trợ ảnh PNG, JPG, JPEG"}), 400
        
        image_folder = 'static/images'
        if not os.path.exists(image_folder):
            os.makedirs(image_folder)

        # Đổi tên file ảnh tránh trùng lặp
        image_filename = f"{int(time.time())}_{image_url.filename}"
        image_path = os.path.join(image_folder, image_filename)
        image_url.save(image_path)

    # Chèn vào database
    cursor.execute(
        "INSERT INTO laptops (name, brand, price, specifications, image_url) VALUES (%s, %s, %s, %s, %s)",
        (name, brand, price, specifications, image_filename)
    )
    db.commit()
    
    return jsonify({"message": "Laptop đã được thêm thành công!"})

# API xóa laptop
@app.route('/delete_laptop/<int:laptop_id>', methods=['DELETE'])
def delete_laptop(laptop_id):
    # Lấy ảnh cũ để xóa file
    cursor.execute("SELECT image_url FROM laptops WHERE id = %s", (laptop_id,))
    laptop = cursor.fetchone()

    if not laptop:
        return jsonify({"error": "Laptop không tồn tại"}), 404

    image_filename = laptop[0]

    # Xóa laptop trong database
    cursor.execute("DELETE FROM laptops WHERE id=%s", (laptop_id,))
    db.commit()

    # Xóa ảnh nếu có
    if image_filename:
        image_path = os.path.join('static/images', image_filename)
        if os.path.exists(image_path):
            os.remove(image_path)

    return jsonify({"message": "Laptop đã được xóa thành công!"})

# API chỉnh sửa laptop
@app.route('/update_laptop/<int:laptop_id>', methods=['POST', 'PUT'])
def update_laptop(laptop_id):
    data = request.form
    name = data.get('name')
    brand = data.get('brand')
    price = data.get('price')
    specifications = data.get('specifications')
    image_file = request.files.get('image_url')

    # Lấy thông tin laptop hiện tại
    cursor.execute("SELECT * FROM laptops WHERE id = %s", (laptop_id,))
    laptop = cursor.fetchone()

    if not laptop:
        return jsonify({"error": "Laptop không tồn tại"}), 404

    image_filename = laptop[5]  # Giữ ảnh cũ nếu không có ảnh mới

    if image_file:
        # Kiểm tra định dạng file ảnh
        allowed_extensions = {"png", "jpg", "jpeg"}
        ext = image_file.filename.rsplit('.', 1)[-1].lower()
        if ext not in allowed_extensions:
            return jsonify({"error": "Chỉ hỗ trợ ảnh PNG, JPG, JPEG"}), 400

        image_folder = 'static/images'
        os.makedirs(image_folder, exist_ok=True)

        # Tạo tên file mới tránh trùng lặp
        new_image_filename = f"{int(time.time())}_{image_file.filename}"
        image_path = os.path.join(image_folder, new_image_filename)
        
        try:
            image_file.save(image_path)  # Lưu ảnh mới
            if image_filename:  # Nếu có ảnh cũ, xóa ảnh cũ
                old_image_path = os.path.join(image_folder, image_filename)
                if os.path.exists(old_image_path):
                    os.remove(old_image_path)

            image_filename = new_image_filename  # Cập nhật ảnh mới
        except Exception as e:
            return jsonify({"error": f"Lỗi lưu ảnh: {str(e)}"}), 500

    # Cập nhật thông tin laptop
    try:
        cursor.execute("""
            UPDATE laptops
            SET name = %s, brand = %s, price = %s, specifications = %s, image_url = %s
            WHERE id = %s
        """, (
            name or laptop[1], 
            brand or laptop[2], 
            price or laptop[3], 
            specifications or laptop[4], 
            image_filename,
            laptop_id
        ))

        db.commit()
        return jsonify({"message": "Laptop đã được cập nhật thành công!"})
    except Exception as e:
        return jsonify({"error": f"Lỗi cập nhật dữ liệu: {str(e)}"}), 500

if __name__ == '__main__':
    app.run(debug=True)