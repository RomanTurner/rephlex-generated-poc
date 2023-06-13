import.meta.globEager("../../allocs/**/*.js");
import.meta.globEager("../../allocs/**/*.css");

import "~/stylesheets/user.css";
import "./index.css";

import "htmx.org";

import { Application } from "@hotwired/stimulus";
import HelloController from "~/controllers/hello_controller";
import ClipboardController from "~/controllers/clipboard_controller";
import Dropdown from "stimulus-dropdown";

window.Stimulus = Application.start();
Stimulus.register("hello", HelloController);
Stimulus.register("clipboard", ClipboardController);
Stimulus.register("dropdown", Dropdown);

import { Editor } from "@tiptap/core";
import StarterKit from "@tiptap/starter-kit";

new Editor({
  element: document.querySelector(".element"),
  extensions: [StarterKit],
  content: "<p>Hello World!</p>",
});
