# HostelHub – Smart Hostel Management System

A dynamic, terminal-based Hostel Management System built with pure Java and Object-Oriented Programming (OOP) principles. 

HostelHub simplifies hostel administration by providing automated multi-hostel configuration, distance-based student eligibility validation (the 30 km rule), room allocations, staff assignment, and system audit reporting with file persistence.

---

## 🌟 Key Features

1. **Dynamic Hostel & Room Configuration:**
   * Create hostels (Boys / Girls) with custom floor and room counts.
   * Auto-generate standard multi-floor hostels (even 10–12 floors) in seconds.
   * Configure room capacity (2, 3, or 4-seater), AC / Non-AC, and Attached / Common washroom.
   * Dynamic formula-based fee calculation per room.

2. **Smart Student Registration (The 30 km Rule):**
   * Students register using their unique Roll Number, department, year, and home distance.
   * **Distance > 30 km:** Placed in the **Eligible Priority Queue** (First-Come, First-Served).
   * **Distance ≤ 30 km:** Placed on the **Localite Waitlist** to ensure outstation students get room allocation priority.

3. **Room Allocation Engine:**
   * Validates gender match (prevents male students from being placed in girls hostels and vice versa).
   * Validates room capacity and bed availability.
   * Enforces the 30 km outstation priority rule.

4. **Staff Management Hierarchy:**
   * **Warden / Assistant Warden:** Supervise the entire hostel building and handle approvals.
   * **Floor Caretakers:** Assigned to specific floors to oversee maintenance and bed occupancy.

5. **Data Persistence & Audit Reporting:**
   * Automatically serializes all system entities to disk (`data/hostelhub_state.dat`) so data survives across restarts.
   * Generates a comprehensive audit report and exports it to `data/system_report.txt`.

---

## 🏗️ Core OOP Concepts Implemented

* **Encapsulation:** Private fields across all models with business logic validation inside getters and setters.
* **Abstraction:** Abstract base classes `Person` and `Staff` defining contracts (`displayDetails()`, `getRole()`).
* **Inheritance:** Multilevel hierarchy:
  $$\text{Person} \longrightarrow \text{Student}$$
  $$\text{Person} \longrightarrow \text{Staff} \longrightarrow \text{Warden} \text{ / } \text{Caretaker}$$
* **Polymorphism:** Method overriding of `displayDetails()` across subclasses with dynamic method dispatch.
* **Composition ("HAS-A"):** `Hostel` has `Floor`s, `Floor` has `Room`s, `Room` has `Student` roll numbers.
* **Collections Framework:** `ArrayList`, `LinkedHashMap` for $O(1)$ roll number lookups, and `LinkedList` for FCFS queues.
* **File Handling & Serialization:** Binary object streaming (`ObjectOutputStream`/`ObjectInputStream`) and text report export (`PrintWriter`).

---

## 📂 Project Structure

```text
Java_Project/
├── src/
│   └── com/
│       └── hostelhub/
│           ├── model/        # Entities: Person, Student, Staff, Warden, Caretaker, Hostel, Floor, Room
│           ├── service/      # Business logic & Persistence: HostelService
│           └── Main.java     # Interactive terminal controller
├── data/                     # Persistent storage and exported audit reports
├── .gitignore
├── run.bat                   # 1-click execution script for Windows
└── README.md
```

---

## 🚀 How to Run

### Method 1: Using the Batch Script (Windows)
Double-click `run.bat` or run:
```powershell
.\run.bat
```

### Method 2: Manual Terminal Commands
Compile:
```powershell
javac -d bin -sourcepath src src/com/hostelhub/Main.java
```
Run:
```powershell
java -cp bin com.hostelhub.Main
```

### Method 3: In VS Code / IntelliJ
Open the `Java_Project` folder in your IDE, open `src/com/hostelhub/Main.java`, and press **Run / F5**.
