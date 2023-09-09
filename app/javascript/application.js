// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"
import 'sweetalert2'
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()
import './direct_uploads'