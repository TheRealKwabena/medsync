# MedSync Backend

## 🚀 Project Overview

MedSync is a **real-time medication adherence system** that ensures patients take their medications on time. It integrates **Spring Boot (Java)** for the backend, **Flutter** for the frontend, and **Apache Kafka** for event-driven communication. The system also utilizes **PostgreSQL** for database management.

## 📌 Features

✅ User authentication & role management (Patients, Doctors, Pharmacists)\
✅ Medication schedule management with automated reminders\
✅ Real-time **Kafka-based alert system** for missed medications\
✅ Wearable device integration for vitals monitoring\
✅ Emergency alerts sent via **Kafka, Twilio (SMS/Email)**\
✅ AI-powered **health risk predictions** (Optional)\
✅ Pharmacy integration for **digital prescriptions**\
✅ **CI/CD setup with GitHub Actions** for automated deployment

---

## 🏗️ Tech Stack

- **Backend:** Spring Boot, Java 17, Spring Security (JWT/OAuth2), Spring Data JPA
- **Database:** PostgreSQL
- **Messaging:** Apache Kafka
- **Frontend:** Flutter (Mobile)
- **CI/CD:** GitHub Actions

---

## 📂 Folder Structure

```
medsync-backend/  
│── src/  
│   ├── main/java/com/medsync/  
│   │   ├── config/           # Config files (Kafka, Security, DB)  
│   │   ├── controller/       # REST Controllers  
│   │   ├── dto/              # DTOs (Data Transfer Objects)  
│   │   ├── model/            # JPA Entity Models  
│   │   ├── repository/       # Database Repositories  
│   │   ├── service/          # Business Logic Services  
│   │   ├── kafka/            # Kafka Producers & Consumers  
│   │   ├── security/         # Security (JWT, OAuth2)  
│   │   ├── MedsyncApplication.java  # Main entry point  
│   ├── resources/  
│   │   ├── application.properties  # Config file  
│── .github/workflows/ci-cd.yml   # GitHub Actions for CI/CD  
│── .docker/                      # Docker setup  
│── README.md                     # Project Overview  
│── pom.xml                        # Maven dependencies  
```

---

## 🚀 Getting Started

### **1️⃣ Clone the Repository**

```bash
git clone https://github.com/therealkwabena/medsync-backend.git
cd medsync-backend
```

### **2️⃣ Set Up PostgreSQL Database**

```sql
CREATE DATABASE medsync;
CREATE USER medsync_user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE medsync TO medsync_user;
```

### \*\*3️⃣ Configure ****`.env`**** or \*\***`application.properties`**

Modify `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/medsync
spring.datasource.username=medsync_user
spring.datasource.password=password
spring.kafka.bootstrap-servers=localhost:9092
```

### **4️⃣ Run Kafka & PostgreSQL using Docker (Optional)**

```bash
docker-compose up -d
```

### **5️⃣ Build & Run the Backend**

```bash
./mvnw clean package
./mvnw spring-boot:run
```

---

## 🧪 Running Tests

### **Unit & Integration Tests**

```bash
mvn test
```

### **Kafka Consumer Tests**

```java
@KafkaListener(topics = "medication_alerts", groupId = "medsync-group")
public void listen(String message) {
    assertThat(message).isNotNull();
}
```

---

## 📢 API Endpoints

### **User Authentication**

| Method | Endpoint           | Description                 |
| ------ | ------------------ | --------------------------- |
| `POST` | `/api/auth/signup` | Register new users          |
| `POST` | `/api/auth/login`  | Authenticate user & get JWT |

### **Medication Management**

| Method | Endpoint                    | Description                |
| ------ | --------------------------- | -------------------------- |
| `POST` | `/api/medications/schedule` | Add medication schedule    |
| `GET`  | `/api/medications/list`     | View scheduled medications |

### **Alerts & Kafka Events**

| Method | Endpoint           | Description      |
| ------ | ------------------ | ---------------- |
| `POST` | `/api/alerts/send` | Send Kafka alert |

---

## 🚀 CI/CD & Deployment

### **GitHub Actions Workflow (********`.github/workflows/ci-cd.yml`********\*\*\*\*)**

```yaml
name: CI/CD Pipeline
on:
  push:
    branches:
      - main
jobs:
  build-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3
      - name: Set up JDK
        uses: actions/setup-java@v3
        with:
          distribution: 'temurin'
          java-version: '17'
      - name: Build with Maven
        run: mvn clean package
      - name: Run Tests
        run: mvn test
```

---

## 🏁 Next Steps

✅ Implement Flutter frontend\
✅ Deploy backend to AWS/GCP/Azure\
✅ Optimize Kafka for scalability

---

## 🤝 Contributing

Want to contribute? Fork this repo & create a pull request! 🚀

📧 Contact: [kasarebo@gsumail.gram.edu](mailto\:kasarebo@gsumail.gram.edu)\
🌍 Project Repo: [GitHub](https://github.com/therealkwabena/medsync-backend)



