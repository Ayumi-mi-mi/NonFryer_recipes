import { application } from "./application"

import HelloController from "./hello_controller"
import ImagePreviewController from "./image_preview_controller"
import PreviewController from "./preview_controller"

application.register("hello", HelloController)
application.register("image-preview", ImagePreviewController)
application.register("preview", PreviewController)
