---
name: metal-shader-effects
description: Implement or debug Metal Shading Language effects, SwiftUI ShaderLibrary colorEffect, distortionEffect and layerEffect, plus custom Metal vertex, fragment and compute shaders for native Apple apps.
---
# Metal Shader Effects

Inspect the target, shader file membership, deployment target, installed SDK, color space and owning render loop. Read ../../references/shader-contracts.md and ../../references/apple-sources.md.

## Select the surface
- Per-pixel recolor of SwiftUI content: colorEffect.
- Coordinate remap: distortionEffect, with an accurate maximum sampling offset.
- Neighbor sampling/compositing: layerEffect and SwiftUI::Layer, bounded sampling offsets and transparent edges.
- Actual mesh rendering: vertex/fragment pipeline through ../metal-3d-interaction/SKILL.md.
- General GPU work: compute pipeline with validated resource access and dispatch bounds.
Do not treat SwiftUI stitchable functions as drop-in fragment/compute entry points. Do not assume SwiftUI layer effects can sample UIKit/AppKit-backed or Metal-backed subviews; verify the surface and provide a supported alternative.

## Define and implement the contract
Write function name, parameter order/types, coordinate units, time units, alpha convention, expected color space, texture/buffer indices and availability. Verify against SDK declarations before using an unfamiliar API. SwiftUI Shader APIs require availability handling on older deployment targets; a runtime branch alone does not resolve unsupported SDK symbols.
Keep Swift and MSL argument ordering identical. Ensure .metal files compile into the intended target library; resolve the correct library/bundle for packaged resources. Keep Swift/MSL memory layouts consistent.
Use bounded time and dimensions, guard division by zero, avoid NaNs and undefined texture access. Preserve premultiplied alpha when operating on SwiftUI colors. Keep sampling radii and loops bounded. Choose precision deliberately and test gradients, transparent edges and light/dark backgrounds.
For compute, use suitable threadgroup sizes, bounds-check over-dispatched threads, and synchronize read/write hazards through supported Metal mechanisms. Do not block the main thread waiting for GPU completion each frame.

## Motion and fallback
Expose a small number of meaningful parameters. One clock owns time; pause when hidden/inactive and when Reduce Motion calls for a static effect. Do not rebuild pipelines on every parameter update. Prefer a static native composition if the shader is unavailable or fails. Preserve text readability and control hit testing; decorative distortion must not imply displaced hit targets.
The ../../examples/shader-study/ files illustrate a small SwiftUI color effect. Follow its README for target membership and validation limits; it is not a full app or 3D renderer.

## Verify
Compile MSL and the Swift integration for intended targets, then inspect actual output, clipping, transparency, resize, accessibility settings and repeated appearance/disappearance. Use GPU capture/profiling when GPU performance is in scope. Report compilation separately from visual/device evidence through ../apple-motion-review/SKILL.md.
