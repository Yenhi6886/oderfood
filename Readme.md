# Oderfood - Hệ thống đặt món ăn trực tuyến

Ứng dụng web đặt món ăn được xây dựng với Spring Framework, Hibernate và Thymeleaf. 

## Công nghệ sử dụng

- **Backend**: Java 17, Spring Framework 5.3.34, Spring Security 5.7.12
- **ORM**: Hibernate 5.6.15, Spring Data JPA 2.7.18
- **Template Engine**: Thymeleaf 3.1.2
- **Database**: MySQL 8.0
- **Build Tool**: Gradle
- **Server**: Tomcat 9 (Gretty)
- **WebSocket**: Spring WebSocket & Messaging
- **Docker**: Hỗ trợ containerization

## Yêu cầu hệ thống

- Java JDK 17 trở lên
- MySQL 8.0 trở lên
- Gradle (hoặc sử dụng Gradle Wrapper có sẵn)
- Docker (tùy chọn)

## Hướng dẫn Clone và Cài đặt

### 1. Clone Repository

```bash
git clone https://github.com/Yenhi6886/oderfood.git
```

Hoặc sử dụng SSH:

```bash
git clone git@github.com:Yenhi6886/oderfood. git
```

### 2. Di chuyển vào thư mục project

```bash
cd oderfood
```

### 3. Cấu hình Database

Tạo database MySQL:

```sql
CREATE DATABASE oderfood CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Cấu hình kết nối database trong file `src/main/resources/application.properties` hoặc file cấu hình tương ứng: 

```properties
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/oderfood?useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource. password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# Hibernate Configuration
spring.jpa. hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

### 4. Build Project

Sử dụng Gradle Wrapper (khuyến nghị):

#### Windows:
```bash
gradlew.bat build
```

#### Linux/Mac:
```bash
./gradlew build
```

### 5. Chạy ứng dụng

#### Sử dụng Gretty (Development):
```bash
# Windows
gradlew.bat appRun

# Linux/Mac
./gradlew appRun
```

Ứng dụng sẽ chạy tại:  **http://localhost:8080**

#### Sử dụng Docker: 

Build Docker image:
```bash
docker build -t oderfood . 
```

Chạy container:
```bash
docker run -p 8080:8080 oderfood
```

### 6. Deploy (Production)

Build file WAR:
```bash
./gradlew war
```

File WAR sẽ được tạo tại: `build/libs/oderfood. war`

Deploy file WAR lên Tomcat server hoặc application server tương thích.

## Tính năng chính

-  Đặt món ăn trực tuyến
-  Quản lý người dùng với Spring Security
-  Xác thực và phân quyền
-  WebSocket cho real-time communication
-  Quản lý đơn hàng
-  Upload hình ảnh món ăn
-  Responsive design với Thymeleaf

## Dependencies chính

- **Spring Framework**: WebMVC, Security, WebSocket, Messaging
- **Hibernate ORM**: Quản lý database và entities
- **Thymeleaf**: Server-side template engine
- **MySQL Connector**:  Kết nối MySQL database
- **Jackson**: JSON processing
- **Lombok**: Giảm boilerplate code
- **Commons FileUpload**:  Xử lý file upload
- **OkHttp**: HTTP client cho API calls

## Development

### Clean và rebuild project:
```bash
./gradlew clean build
```

### Chạy tests:
```bash
./gradlew test
```

### Xem dependencies:
```bash
./gradlew dependencies
```

## Troubleshooting

### Lỗi kết nối database:
- Kiểm tra MySQL service đã chạy chưa
- Xác nhận username/password trong file cấu hình
- Đảm bảo database đã được tạo

### Lỗi port 8080 đã được sử dụng:
- Thay đổi port trong `build.gradle` tại section `gretty.httpPort`
- Hoặc stop process đang sử dụng port 8080

### Lỗi Java version:
- Đảm bảo đang sử dụng Java 17 trở lên
- Kiểm tra:  `java -version`
```
