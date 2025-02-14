# SkillSprint

**SkillSprint** is a global company specializing in organizing workshops, seminars, and webinars across various industries.  

The company hosts a diverse array of events, ranging from small, niche workshops to large-scale international conferences. These events bring together experts, professionals, and enthusiasts from around the world.  

As **SkillSprint** continues to grow, managing the logistical details of these events—such as tracking speakers, scheduling sessions, and handling attendee registrations—has become increasingly challenging.  

That's why **SkillSprint** requires a database system that streamlines event management and secures data integrity. This system enables the company to efficiently organize its events, monitor speakers, track attendee registrations, and gather feedback.  

**SkillSprint** is also exploring potential partnerships with local businesses to enhance the attendee experience. However, their immediate priority is leveraging collected data to gain meaningful insights into their operations. They aim to understand speaker popularity, attendance trends, and feedback to improve future events and make data-driven decisions.  

## Database Schema Overview
The project follows a **Snowflake** Schema design to efficiently manage event and conference data. The schema is highly normalized, reducing data redundancy while maintaining clear relationships between entities.

![Image](https://github.com/user-attachments/assets/0e0201fc-d81c-44ff-abed-a8ebf823ed9c)

## Events Dashboard 
The dashboard displays all specified event areas, including upcoming sessions, the average rating (based on at least 10 participants), and other general information.

![Image](https://github.com/user-attachments/assets/22747ec6-696f-4591-b408-e6b852abda27)

## Entities Overview

- **Speakers**  
  Stores details about event speakers  

- **Sessions**  
  Represents individual sessions conducted by speakers  

- **Attendees**  
  Contains information about event participants  

- **Registrations**  
  Acts as a bridge between attendees and events  

- **Reviews**  
  Captures attendee ratings  

- **Venues**  
  Stores details about locations where sessions are held  

- **Schedule**  
  Links sessions, venues, and event timings  


By leveraging structured, normalized approach, the schema ensures efficient data retrieval, integrity, and scalability.
