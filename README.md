# Scenes

<div align="center">

### Movie Discovery Application

A Flutter movie discovery application focused on browsing, searching, pagination, watchlist management, and experimenting with multiple data storage strategies.

</div>

---

## 📱 Overview

Scenes is a Flutter-based movie application that allows users to discover and search for movies while managing their personal watchlist.

The project was also used as a practical experiment for working with multiple local and remote storage solutions, using the **Strategy Design Pattern** to switch between different watchlist implementations.

---

## ✨ Key Features

- 🎬 Movie discovery and browsing
- 🔍 Movie search
- 📄 Pagination for movie results
- ❤️ Watchlist management
- 💾 Multiple watchlist storage implementations
- 🔄 Runtime switching between storage strategies
- ⚡ API response caching
- ⏱️ Search debounce to reduce unnecessary API requests
- 🏗️ Clean Architecture
- 🧠 Cubit for state management
- 🧩 Dependency Injection using GetIt

---

## 🎬 Movie Discovery

The application provides a movie browsing experience where users can explore available movies and load additional results through pagination.

Pagination helps avoid loading a large number of movies in a single request and keeps the application responsive while browsing through results.

<!-- Add movie discovery screenshot -->

---

## 🔍 Search & API Optimization

The search functionality was designed with API efficiency in mind.

### Search Debounce

Instead of sending a request on every keystroke, the search input uses **debouncing** to wait for a short period after the user stops typing before triggering the API request.

This significantly reduces unnecessary network requests during continuous typing.

### API Response Caching

Previously fetched API responses can be reused instead of requesting the same data again.

This reduces:

- Network requests
- Response time
- API load
- Unnecessary repeated work

### Pagination

Search and movie results are loaded progressively using pagination rather than requesting the entire dataset at once.

<!-- Add search screenshot -->

---

## ❤️ Watchlist

Users can add movies to their watchlist and manage them independently from the movie discovery flow.

The main goal of the implementation was to keep the watchlist functionality independent from the underlying storage technology.

The application supports multiple watchlist implementations:

- Firebase / Firestore
- Hive
- SQFLite

<!-- Add watchlist screenshot -->

---

## 🧩 Strategy Design Pattern

One of the main engineering goals of Scenes was experimenting with the **Strategy Design Pattern**.

Instead of coupling the watchlist feature to a specific database, the application defines a common abstraction for watchlist operations.

Different implementations can then provide the actual storage mechanism:

```text
             Watchlist Strategy
                    │
        ┌───────────┼───────────┐
        │           │           │
     Firestore     Hive       SQFLite
