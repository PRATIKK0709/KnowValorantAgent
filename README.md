# KnowValorantAgent

This SwiftUI application allows users to view information about agents in the game Valorant. It fetches data from the Valorant API to display a list of agents with their icons and names. Users can select an agent to view detailed information including description and abilities.

## Project Structure

The project is organized into several files and directories:

- **Models**: Contains the data models used in the application.
  - `Agent.swift`: Defines the `AgentData` and `Ability` structs representing agent data.

- **Views**: Contains SwiftUI views related to agents.
  - `AgentGridView.swift`: Defines the `AgentGridView` view to display a grid of agents.
  - `AgentDetailView.swift`: Defines the `AgentDetailView` view to display detailed information about a selected agent.
  - `AbilityView.swift`: Defines the `AbilityView` view to display information about an agent's abilities.
  - `AsyncImageView.swift`: Defines the `AsyncImageView` view to asynchronously load and display images.

- **Networking**: Contains networking-related functionality.
  - `Networking.swift`: Defines networking-related functions and structs (`AgentUUIDsResponse`, `AgentDetailResponse`).
  - `ImageCache.swift`: Defines the `ImageCache` class for image caching.

- **ContentView.swift**: Contains the main content view (`ContentView`) of the application.



