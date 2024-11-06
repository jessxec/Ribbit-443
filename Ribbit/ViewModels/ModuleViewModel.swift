//
//  ModuleViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

import Foundation

@MainActor
class ModuleViewModel: ObservableObject {
    private let moduleService: ModuleServiceProtocol

    @Published var modules: [Module] = []
    @Published var selectedModule: Module?
    @Published var isLoading = false
    @Published var errorMessage: String?

    init(moduleService: ModuleServiceProtocol = ModuleService()) {
        self.moduleService = moduleService
    }

    // Fetch all modules (for the initial screen where you list modules)
    func fetchAllModules() async {
        isLoading = true
        do {
            modules = try await moduleService.fetchAllModules()
        } catch {
            errorMessage = "Failed to fetch modules: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }
    
    // Fetch a specific module by ID
    func fetchModule(by id: String) async {
        isLoading = true
        do {
            selectedModule = try await moduleService.fetchModule(by: id)
        } catch {
            errorMessage = "Failed to fetch module: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }
    
    // Update module unlock status
    func updateModuleUnlockStatus(moduleId: String, isUnlocked: Bool) async {
        isLoading = true
        do {
            try await moduleService.updateModuleUnlockStatus(moduleId: moduleId, isUnlocked: isUnlocked)
            if let index = modules.firstIndex(where: { $0.id == moduleId }) {
                modules[index].isUnlocked = isUnlocked
            }
        } catch {
            errorMessage = "Failed to update module unlock status: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }
}
