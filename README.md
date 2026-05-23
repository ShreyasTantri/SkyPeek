# SkyPeek

Production-style SwiftUI weather app built to learn real iOS engineering practices, architecture, and scalable app design.

---

# Architecture Overview

Current architecture direction:

- MVVM
- DTO-based decoding
- Repository pattern (planned)
- Local JSON loading before live API integration

The focus is understanding data flow and architecture before adding networking complexity.

---

# Data Flow

weather.json  
↓  
Data (Handled by LocalFileLoader)  
↓  
DTO (Decoded using JSONDecoder)  
↓  
Domain Model  
↓  
ViewModel  
↓  
SwiftUI View

---

# LocalFileLoader Responsibility

`LocalFileLoader` is responsible only for:

File → Data

Responsibilities:
1. Find local JSON file
2. Read file contents
3. Return Data

It does NOT:
- decode JSON
- map models
- contain business logic

Decoding responsibility belongs to `JSONDecoder`.

---

# DTO Understanding

DTOs mirror raw API response structure.

They:
- represent transport-layer data
- follow backend naming conventions
- are separate from domain models

DTOs help isolate backend structure from app logic and UI.

---

# Current Progress

Completed:
- Weather DTO setup
- Local JSON setup
- LocalFileLoader implementation
- Initial architecture planning

Next Steps:
- Decode JSON into DTO
- Map DTO → Domain Model
- Create ViewModel state handling
- Build SwiftUI screen

---

# Key Learnings

- Codable ignores unmapped JSON fields
- DTOs should mirror API structure
- `JSONDecoder` converts Data → Swift objects
- File loading and decoding should remain separate responsibilities
- Prefer immutable (`let`) properties unless mutation is required
