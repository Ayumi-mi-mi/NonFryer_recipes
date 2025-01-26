document.addEventListener("DOMContentLoaded", () => {
  const stepsSection = document.getElementById("steps-section");

  function updateStepNumbers() {
    const stepItems = stepsSection.querySelectorAll(".step-item");
    stepItems.forEach((item, index) => {
      item.querySelector(".step-number").textContent = index + 1;
    });
  }

  stepsSection.addEventListener("click", (e) => {
    if (e.target.classList.contains("add-step")) {
      // 新しいステップ入力欄を追加
      const newStep = document.createElement("div");
      newStep.className = "step-item flex items-center space-x-2 mb-2";
      newStep.innerHTML = `
        <button class="remove-step text-gray-700 px-2">×</button>
        <span class="step-number text-gray-400"></span>
        <input type="text" class="w-full bg-white border border-gray-300 rounded px-4 py-2" placeholder="" />
        <button class="add-step text-gray-700 px-4 py-2 rounded">＋</button>
      `;
      stepsSection.appendChild(newStep);
      updateStepNumbers();
    } else if (e.target.classList.contains("remove-step")) {
      // 入力欄を削除
      const stepItems = stepsSection.querySelectorAll(".step-item");
      if (stepItems.length > 1) {
        e.target.parentElement.remove();
        updateStepNumbers();
      }
    }
  });

  // 初期状態で番号を設定
  updateStepNumbers();
});
