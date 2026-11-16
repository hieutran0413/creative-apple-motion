# Metal renderer checkpoints
- Setup: device -> command queue -> library/functions -> pipeline -> depth state/assets. Record failure at each step.
- Frame: synchronized input snapshot -> available drawable/render pass -> command buffer -> encoder -> draw -> end encoding -> present -> commit. Keep resource reuse safe until GPU completion.
- Resize: drawable pixels -> projection aspect -> depth/offscreen targets. Skip zero dimensions; update both UI and GPU coordinate conversions.
- Teardown: pause drawing, detach delegate, cancel tasks, invalidate owned clocks, release owned resources after work no longer uses them. Do not free shared assets still in use.
- Correctness: vertex stride/offsets, uniform alignment, column/row convention, depth range, winding, normals and color space must agree across Swift/MSL.
- Quality: set explicit resolution/sample/texture budgets; profile before adding postprocessing, continuous animation or higher sample counts.
- Feature support: inspect device capability and supported formats. “Metal 3D” describes the workload; Metal 3/4 are API generations with separate availability and hardware requirements.
