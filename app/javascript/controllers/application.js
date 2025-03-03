import { Application } from "@hotwired/stimulus"
import { Autocomplete } from 'stimulus-autocomplete'
import ImagePreviewController from "./image_preview_controller"
import PreviewController from "./preview_controller"

const application = Application.start()
application.register('autocomplete', Autocomplete)
application.register("image-preview", ImagePreviewController)
application.register("preview", PreviewController)

application.debug = false
window.Stimulus = application

export { application }
