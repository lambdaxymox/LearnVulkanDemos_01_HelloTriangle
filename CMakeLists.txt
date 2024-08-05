cmake_minimum_required(VERSION 3.28)

project("LearnVulkanDemos_01_HelloTriangle" VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")

include(NoInSourceBuilds)
CheckNoInSourceBuilds()

find_package(Vulkan REQUIRED)

add_subdirectory(external/glfw-3.4)
add_subdirectory(external/glm-1.0.1)
add_subdirectory(external/fmt-10.2.0)

add_subdirectory(compile_glsl_shaders)
add_subdirectory(compile_hlsl_shaders)

add_executable(LearnVulkanDemos_01_HelloTriangle)
target_sources(LearnVulkanDemos_01_HelloTriangle PRIVATE
    src/main.cpp
    src/engine.cpp
    src/engine_impl_fmt.cpp
)
target_link_libraries(LearnVulkanDemos_01_HelloTriangle PRIVATE Vulkan::Vulkan)
target_link_libraries(LearnVulkanDemos_01_HelloTriangle PRIVATE glfw)
target_link_libraries(LearnVulkanDemos_01_HelloTriangle PRIVATE glm)
target_link_libraries(LearnVulkanDemos_01_HelloTriangle PRIVATE fmt)
target_link_libraries(LearnVulkanDemos_01_HelloTriangle
    PRIVATE
        compile_glsl_shaders
        compile_hlsl_shaders
)

add_custom_target(run
    COMMAND ${CMAKE_COMMAND} -E env $<TARGET_FILE:LearnVulkanDemos_01_HelloTriangle>
    DEPENDS "LearnVulkanDemos_01_HelloTriangle"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    VERBATIM
)
