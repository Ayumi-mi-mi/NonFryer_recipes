import { application } from "./application"

import AutocompleteController from "./autocomplete_controller"
application.register("autocomplete", AutocompleteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)
