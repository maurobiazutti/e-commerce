// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import $ from "jquery"
window.$ = $
window.jQuery = $

import * as Popper from "@popperjs/core"
import * as bootstrap from "bootstrap"
import "./controllers"

