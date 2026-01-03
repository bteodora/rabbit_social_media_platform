<div align="center">
  <img src="frontend/RabbitApp/public/bunny.svg" alt="OnlyBuns Platform Logo" width="150"/>
  
  <br><br>

  <h1>OnlyBuns Enterprise Social Platform</h1>
  <h3>Distributed Content Management and Social Interaction System for Lagomorph Enthusiasts</h3>

  <p>
    <img src="https://img.shields.io/badge/Backend-Java_Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white" alt="Spring Boot"/>
    <img src="https://img.shields.io/badge/Frontend-Angular_16+-DD0031?style=for-the-badge&logo=angular&logoColor=white" alt="Angular"/>
    <img src="https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
    <img src="https://img.shields.io/badge/Architecture-Service_Oriented-orange?style=for-the-badge" alt="SOA"/>
    <img src="https://img.shields.io/badge/Status-Production_Ready-red?style=for-the-badge" alt="Status"/>
  </p>

  <p>
    <strong>A high-concurrency, scalable web architecture engineered to facilitate digital community engagement, geospatial tracking, and real-time communication. Features custom-built infrastructure components including a proprietary Load Balancer, a configurable Dual-Mode Message Queue system, and bespoke Rate Limiting algorithms.</strong>
  </p>

  <p>
    <a href="Specifikacija projekta ISA 2024.pdf"><strong>📄 View System Specification Document (PDF) »</strong></a>
  </p>
</div>

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Core Application Capabilities](#core-application-capabilities)
3. [Key Architectural Highlights](#key-architectural-highlights)
4. [System Architecture](#system-architecture)
5. [Technology Stack](#technology-stack)
6. [Installation and Setup](#installation-and-setup)
7. [Configuration and Infrastructure Switching](#configuration-and-infrastructure-switching)
8. [Performance and Concurrency](#performance-and-concurrency)
9. [Monitoring and Observability](#monitoring-and-observability)

---

## Project Overview

**OnlyBuns** is a sophisticated social networking solution designed to address specific market gaps in the pet ownership community. While outwardly presented as a niche platform for rabbit enthusiasts, the underlying system acts as a rigorous proof-of-concept for complex distributed systems architectures.

The platform provides a comprehensive ecosystem where users can curate digital identities, publish geo-tagged content, engage in real-time communication, and interact with external service providers (veterinarians, shelters). It solves the problem of fragmented information in the lagomorph care sector by unifying social interaction, care resource discovery, and multimedia sharing into a single, cohesive, and resilient application.

---

## Core Application Capabilities

The application logic is partitioned into distinct functional domains, ensuring a seamless user experience ranging from unauthenticated discovery to administrative oversight.

### 1. User Interaction & Tiered Access
*   **Public Access:** Unauthenticated users possess restricted "Read-Only" access to the global content feed (sorted chronologically) and user profiles, but are strictly blocked from interactive features (Liking, Commenting) via server-side guards.
*   **Secure Registration:** The onboarding process employs **Bloom Filters** for O(1) username uniqueness checks and transactional locking to prevent race conditions during simultaneous registrations. Accounts utilize email-based activation flows.
*   **Profile Management:** Users maintain detailed profiles including follower/following metrics, personal post history, and immutable statistics.

### 2. Digital Content Lifecycle
*   **Geo-Spatial Publishing:** Posts consist of rich media (images), textual descriptions, and precise geolocation data. Users can pinpoint locations via an interactive map interface.
*   **Engagement Engine:** The system supports complex social interactions including likes, temporal-rate-limited commenting (max 60/hour), and following mechanisms (max 50/minute) designed to prevent bot spam.
*   **Trending Algorithms:** A sophisticated analytics engine calculates "Trending" status based on interaction velocity over 7-day, 30-day, and all-time windows, caching results for performance.

### 3. Real-Time & External Integrations
*   **Synchronous Chat:** Built on **WebSockets**, the chat module supports private messaging and dynamic group environments with admin privileges and history retention.
*   **Veterinary Service Discovery:** Through a **Direct Exchange** message queue pattern, the application integrates with external "Rabbit Care" organizations to ingest and display real-time locations of vet clinics and shelters on the user's map.
*   **AdTech Fanout:** A **Fanout Exchange** pattern broadcasts high-engagement posts to external advertising agencies, demonstrating multi-consumer message distribution.

### 4. Administrative & Automated Maintenance
*   **Business Intelligence Dashboard:** Administrators utilize radial graphs and linear charts to visualize system health, including user retention rates, posting frequency, and engagement ratios.
*   **User Management:** Advanced filtering, sorting, and pagination tools allow admins to audit the user base.
*   **Automated Housekeeping:**
    *   **Media Compression:** Daily scheduled tasks iterate through new image assets to apply compression algorithms, optimizing storage.
    *   **Account Pruning:** Automated purging of unactivated accounts occurs on the last day of every month.
    *   **Re-engagement:** Automated notification emails are dispatched to users inactive for 7+ days.

---

## Key Architectural Highlights

This system distinguishes itself through three major custom-engineered components, demonstrating deep understanding of distributed system internals.

### 1. Dual-Mode Message Queue System
The application implements an interface-driven design for asynchronous messaging, allowing administrators to toggle between an industry-standard solution and a proprietary implementation using Spring Profiles.

*   **Profile A (`rabbitmq`):** Leverages the full AMQP protocol for production-grade reliability using RabbitMQ.
*   **Profile B (`custom`):** A bespoke, thread-safe queuing system built from the ground up. It supports:
    *   **Direct Exchange Pattern:** Point-to-point communication used for ingesting veterinary location data.
    *   **Fanout Exchange Pattern:** Broadcasting mechanism used for distributing promoted posts to external advertising agencies.
    *   **Persistence:** Custom serialization to ensure message durability.

### 2. Proprietary Load Balancer
To ensure high availability and horizontal scalability, a custom Load Balancing Service sits at the edge of the network.
*   **Algorithms:** Implements configurable distribution strategies (e.g., Round Robin, Least Connections).
*   **Health Checking:** Active probing of application instances to remove unhealthy nodes from rotation.
*   **Retry Policy:** Automated request rerouting in the event of instance failure, ensuring zero downtime for end-users.

### 3. In-Memory Rate Limiter
A dedicated defensive programming module designed to protect the API from abuse and bot activity.
*   **Mechanism:** Uses a sliding window algorithm stored in volatile memory.
*   **Granularity:** Enforces a strict limit of 5 requests per minute per IP address on sensitive endpoints (e.g., Authentication, Commenting).
*   **Efficiency:** Optimized for O(1) complexity to introduce negligible latency to valid requests.

---

## System Architecture

The system follows a layered architecture designed for separation of concerns and maintainability.

### High-Level Components
1.  **Client Layer:** An **Angular** Single Page Application (SPA) offering a responsive, component-based interface.
2.  **Edge Layer:**
    *   **Custom Rate Limiter:** Protects entry points.
    *   **Custom Load Balancer:** Distributes traffic across backend instances.
3.  **Application Layer:** Java Spring Boot RESTful API services handling core logic, transaction management, and WebSocket connections.
4.  **Messaging Layer:** Polymorphic bean injection allowing for runtime switching between RabbitMQ and Custom MQ.
5.  **Data Persistence Layer:** PostgreSQL for relational data and file systems for media storage.
6.  **Observability Layer:** Prometheus and Grafana for metrics and visualization.

---

## Technology Stack

The technology choices reflect a commitment to stability, strong typing, and enterprise adoption.

### Backend Core
*   **Java 17+ / Spring Boot:** Chosen for dependency injection, transaction management (`@Transactional`), and robust security context.
*   **Spring Data JPA / Hibernate:** For Object-Relational Mapping (ORM).
*   **Spring Security:** For implementing rigorous authentication and authorization chains.
*   **WebSockets (STOMP):** For low-latency, real-time messaging.

### Frontend Interface
*   **Angular (v16+):** Selected for its rigorous structure, TypeScript integration, and dependency injection patterns which mirror the backend architecture.
*   **RxJS:** Used for reactive state management and handling asynchronous data streams.
*   **Leaflet / OpenLayers:** For rendering complex geospatial data.

### Data & Infrastructure
*   **PostgreSQL:** The primary relational database system.
*   **Prometheus & Grafana:** Used for white-box monitoring of system metrics (CPU usage, Request latency, Active users).
*   **Docker:** Containerization of services.

---

## Installation and Setup

### Prerequisites
*   Java Development Kit (JDK) 17 or higher
*   Node.js (v18+) and npm
*   PostgreSQL 14+
*   RabbitMQ (Optional, if not using Custom MQ)

### Deployment Steps

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/bteodora/rabbi-social-media-platform.git
    cd onlybuns-platform
    ```

2.  **Database Configuration**
    Ensure PostgreSQL is running and create the `onlybuns_db` database.

3.  **Backend Initialization**
    ```bash
    cd backend
    ./mvnw clean install
    ./mvnw spring-boot:run
    ```

4.  **Frontend Initialization**
    ```bash
    cd frontend/RabbitApp
    npm install
    ng serve
    ```

5.  **Access Points**
    *   Frontend: `http://localhost:4200`
    *   Backend API: `http://localhost:8080`
    *   Load Balancer Entry: `http://localhost:8090` (if enabled)

---

## Configuration and Infrastructure Switching

The system architecture utilizes **Spring Profiles** to dynamically load infrastructure components at runtime. This allows for seamless transitions between the custom-built educational infrastructure and production-grade message brokers without code alteration.

To switch the underlying messaging architecture, modify the `src/main/resources/application.properties` file:

```properties
# -----------------------------------------------------------
# MESSAGE QUEUE STRATEGY SELECTION
# -----------------------------------------------------------
# 'rabbitmq' - Uses the external RabbitMQ broker (AMQP)
# 'custom'   - Uses the internal proprietary Message Queue implementation
# -----------------------------------------------------------

spring.profiles.active=rabbitmq
```

### Additional Configuration
When utilizing the `custom` profile, the system initializes internal socket listeners on dedicated ports:

```properties
# Custom MQ Settings (Active only when profile is 'custom')
app.custom.mq.port=9090
app.custom.mq.persistence=true
```

---

## Performance and Concurrency

### Concurrency Handling
The system addresses the **Lost Update** and **Phantom Read** phenomena through:
*   **Pessimistic Locking:** Applied to critical database rows (e.g., during "Like" incrementation or Follow actions).
*   **Thread Simulation:** `Thread.sleep()` is utilized in test profiles to deterministically simulate race conditions and verify lock integrity.

### Caching Strategy
A Level 2 (L2) cache is implemented for frequently accessed data:
*   **Geospatial Data:** Post locations are cached to reduce read latency on map rendering.
*   **Trend Calculation:** Computationally expensive trend analysis is cached and refreshed periodically.

---

## Monitoring and Observability

The system includes a dedicated telemetry module. Using **Prometheus** exporters, the application exposes:
*   **HTTP Metrics:** Average request duration over a 24-hour window.
*   **System Metrics:** Real-time CPU and Memory utilization.
*   **Business Metrics:** Number of concurrent active users.

These metrics are visualized in **Grafana** dashboards, allowing operations teams to proactively identify bottlenecks.
