---
name: metal-3d-interaction
description: Build or repair native Metal and MetalKit 3D scenes for iOS, iPadOS and macOS, including MTKView, cameras, meshes, lighting, picking, gesture-driven objects and renderer lifecycle.
---
# Metal 3D Interaction

Read ../../references/platform-contract.md and ../../references/metal-rendering.md. Inspect the current renderer and asset pipeline. Keep an existing suitable engine when the task permits; use Metal/MetalKit for an explicitly requested Metal renderer. A SwiftUI rotation3DEffect is not a mesh renderer.

## Define the scene
Specify subject, camera/projection, geometry, lighting, materials, action and fallback. Keep navigation, labels and meaningful controls in native UI. Provide accessible controls equivalent to scene picking, rotation and selection.
Separate camera choreography, user orbit and object motion into explicit state owners or transforms. One renderer loop consumes the composed state; do not let multiple animators write the camera matrix.

## Build the pipeline
Create a device with failure handling, command queue, Metal library and render pipeline outside the frame loop. Use MTKViewDelegate; retain the renderer through its owning coordinator/controller because the view delegate does not own it. Integrate through UIViewRepresentable for iOS/iPadOS/Catalyst and NSViewRepresentable for native macOS, with explicit teardown.
Match pipeline color/depth/sample formats to render attachments. Define vertex layout, matrix convention, coordinate handedness, depth testing, culling, normals, lighting and color space deliberately. Verify Swift/MSL buffer alignment; float3 packing is not interchangeable with arbitrary Swift structs.
Update aspect and size-dependent textures in drawableSizeWillChange. Skip zero-size drawables. Use drawable pixel dimensions for GPU work and view points for input, converting deliberately. Convert picking coordinates through the inverse projection/view transform with documented Y and depth conventions.
Use elapsed/delta time, clamp resume spikes, and avoid fixed increments per frame. Prefer render-on-demand for static scenes. Synchronize CPU-written buffers with GPU use; use bounded in-flight resources. Every early return must preserve synchronization balance. Acquire the drawable late, handle nil resources, end encoding, present and commit correctly.

## Lifecycle and resilience
Pause when inactive/offscreen; resume without time jumps. Release scene-owned resources and cancel loading on teardown; keep shared resources alive while used. Ignore stale async load results. Avoid per-frame pipeline creation, texture loading or unbounded allocations.
Handle missing device, shader/library/pipeline errors, asset failure and command-buffer errors with a visible fallback. Never force unwrap GPU setup. Resize/recreate resources deliberately. Check GPU family, feature support and formats, not just OS version. Scale quality from measured budgets.
Use ../metal-shader-effects/SKILL.md for shader changes. Use ../apple-motion-review/SKILL.md for runtime, lifecycle and GPU capture. Simulator results do not certify physical-device performance.
