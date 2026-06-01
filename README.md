# SkyPeek

Production-style SwiftUI weather app built to learn real iOS engineering practices, architecture, and scalable app design.

---

# Architecture Overview

Current architecture direction:

- MVVM
- DTO-based decoding
- Service layer for API communication
- Repository pattern for data orchestration
- Local JSON loading for sample data
- Live weather API integration

The focus is understanding data flow, layering, and state-driven UI.

---

# Data Flow

## Local sample flow
weather.json  
↓  
Data (handled by LocalFileLoader)  
↓  
DTO (decoded using JSONDecoder)  
↓  
Domain Model  
↓  
ViewModel  
↓  
SwiftUI View

## Live API flow
Open-Meteo API  
↓  
URLSession  
↓  
Data  
↓  
DTO  
↓  
Domain Model  
↓  
Repository  
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

# Repository and Service Responsibilities

## Service
Responsible for talking to the API and returning raw data.

## Repository
Responsible for orchestrating data flow and returning domain models to the ViewModel.

This keeps the UI layer independent from transport details.

---

# Current Progress

Implemented:

- Weather DTO setup
- Local JSON loading
- LocalFileLoader
- DTO decoding with JSONDecoder
- DTO → Domain Model mapping
- WeatherCondition enum mapping
- Weather domain model
- Display formatting helpers
- WeatherViewModel
- State-driven UI (`idle`, `loading`, `loaded`, `failure`)
- Repository layer
- Service layer
- Open-Meteo API integration
- Async/await networking
- Loading and failure handling
- Basic weather card UI

---

# Key Learnings

- DTOs and domain models should have separate responsibilities
- Domain models should not expose raw API structures
- Repository acts as the boundary between data sources and UI
- Async/await simplifies asynchronous networking code
- SwiftUI views should react to state changes
- UI formatting logic can be separated using computed properties
- Weather codes can be mapped into strongly typed enums

---

# Notes

This app is being built as a learning project to understand architecture, SwiftUI state flow, networking, and model separation.
