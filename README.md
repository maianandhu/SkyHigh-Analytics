# SkyHigh Analytics: Airline Booking & Passenger Trend Analysis

## ✈️ Project Overview
This project focuses on transforming raw airline transactional data into actionable business intelligence. By analyzing passenger demographics, flight operations, and booking patterns using **SQL**, the goal is to provide strategic recommendations for revenue growth and route optimization.

The analysis covers:
* **1,000** Passengers
* **50** Unique Flights
* **5,000** Individual Bookings

## 📊 Database Schema
The project utilizes three relational tables. You can find the relationship diagram in the repository.
* **Passengers**: ID, Name, Age, Gender, Country.
* **Flights**: ID, Airline, Source/Destination, Distance.
* **Bookings**: ID, Ticket Price, Date, Seat Class (Economy/Business).

## 🛠️ Technologies Used
* **SQL (MySQL)**: For data extraction, cleaning, and complex joins.
* **Data Visualization**: (Add Power BI or Excel here if you used them for the charts!)

## 🔍 Key Insights
* **Revenue Multiplier**: Business Class generates **4x more revenue** per ticket than Economy, despite lower volume.
* **Market Leader**: The **UK** is the primary market, leading in both total passenger count and Business Class bookings.
* **Peak Demand**: **March** is the busiest month for bookings, and **Sundays** see the highest volume of transactions.
* **Top Airline**: **Lufthansa** leads in total revenue, while **Air India** dominates passenger loyalty among Indian travelers.

## 🚀 Business Recommendations
1. **Expand High-Demand Routes**: Increase flight frequency to top destinations like Doha, Frankfurt, and Singapore.
2. **Targeted Marketing**: Focus premium marketing efforts on the UK and European markets to maximize Business Class sales.
3. **Dynamic Pricing**: Implement weekend-specific promotions to capitalize on Sunday booking peaks.
4. **Loyalty Programs**: Launch a rewards system targeting the "Frequent Flyer" segment (passengers with 3+ bookings).

## 📂 How to Use
1. Clone the repository.
2. Import the datasets found in the `/Data` folder into your SQL environment.
3. Run `Airline_Booking.sql` to replicate the analysis phases.

---
**Project by Anand** *March 2026*
