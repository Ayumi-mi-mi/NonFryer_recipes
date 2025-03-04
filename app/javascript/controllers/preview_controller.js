import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview"];

  previewImage() {
    const input = this.inputTarget;
    const preview = this.previewTarget;
    const files = input.files;

    if (files && files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        preview.innerHTML = `<img src="${e.target.result}" class="w-[160px] h-[100px] object-cover rounded">`;
      };
      reader.readAsDataURL(files[0]);
    }
  }

  resetPreview() {
    this.previewTarget.innerHTML = "";
  }
}
