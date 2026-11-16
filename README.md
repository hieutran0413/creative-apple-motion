# Creative Apple Motion
A native Apple adaptation of Creative Web Motion for iOS, iPadOS and macOS. Version 0.1.0. This is a Codex skills plugin, not an installable iPhone app.

## Skills
| Skill | Scope |
| --- | --- |
| creative-apple-motion | App art direction, target selection and workflow |
| native-motion-choreography | SwiftUI/UIKit motion, gestures, interactive transitions and AppKit boundaries |
| metal-3d-interaction | MetalKit renderer, 3D geometry/camera/picking and lifecycle |
| metal-shader-effects | SwiftUI stitchable shaders and Metal render/compute contracts |
| apple-motion-review | Adaptive UI, accessibility, runtime and GPU verification |

## Conversion
Creative Web Motion orchestration becomes native app orchestration; GSAP choreography becomes state-driven SwiftUI/UIKit choreography; Three.js work becomes Metal/MetalKit work; browser verification becomes target-specific build, simulator/device and GPU verification. Scroll/pointer patterns become appropriate native gestures, selection and adaptive windows. Metal shaders have a dedicated skill.

UIKit supports the iOS/iPadOS and Catalyst paths. Native macOS uses SwiftUI/AppKit. Metal 3D means three-dimensional Metal rendering; it does not force a particular Metal API generation. No web engine or external plugin dependency is bundled.

## Usage
Ask `$creative-apple-motion` to build or refine an app interaction in your project, or invoke a specialist skill directly. Existing repository conventions and deployment targets govern implementation. Open a new Codex chat after installation so the skills are discovered.

## Included material
Five skills, focused native references, motion/verification templates and a small SwiftUI/MSL shader study. The study is source for an existing Xcode target, not a full Xcode project or a complete 3D engine. See examples/shader-study/README.md and VALIDATION.md.

## Provenance
Adapted from the user's local Creative Web Motion 0.1.0 workflow. Original native guidance was written for this conversion using official Apple references. Bundled GSAP/Three.js upstream source and web demo were not copied into this package. The original plugin remains available separately.
