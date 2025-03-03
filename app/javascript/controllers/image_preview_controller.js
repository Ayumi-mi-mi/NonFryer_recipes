import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview", "removeField"];

  previewImage() {
    const input = this.inputTarget;
    const preview = this.previewTarget;
    const files = input.files;

    if (files && files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        preview.innerHTML = `<img src="${e.target.result}" class="h-[220px] md:h-[480px] w-full object-cover rounded">`;
      };
      reader.readAsDataURL(files[0]);
    } else {
      const existingImage = preview.dataset.imageUrl;
      if (existingImage) {
        preview.innerHTML = `<img src="${existingImage}" class="h-[220px] md:h-[480px] w-full object-cover rounded">`;
      }
    }
  }

  removeImage() {
    this.previewTarget.innerHTML = "";
    this.inputTarget.style.display = "block";
    this.removeFieldTarget.value = "true";
  }

  resetPreview() {
    this.previewTarget.innerHTML = "";
  }
}
