document.addEventListener("DOMContentLoaded", () => {
  // 各セクション内の番号を更新する関数
  function updateNumbers(section) {
    const items = section.querySelectorAll(".item");
    items.forEach((item, index) => {
      // 各アイテム内の番号を更新
      const numberElement = item.querySelector(".step-number");
      if (numberElement) {
        numberElement.textContent = index + 1; // 1から始まる番号を設定
      }
    });
  }

  // 全てのセクションに対してイベントを設定
  document.querySelectorAll(".section").forEach((section) => {
    section.addEventListener("click", (e) => {
      if (e.target.classList.contains("add-item")) {
        // 新しい入力欄を追加
        const sectionType = section.getAttribute("data-section");
        const newItem = document.createElement("div");
        newItem.className = "item flex items-center space-x-2 mb-2";

        // 入力欄にセクションごとのスタイリングを適用
        const inputClass = sectionType === "tags" ? "w-1/3" : "w-full"; // Tagsセクションだけ横幅を狭く
        newItem.innerHTML = `
          <span class="step-number text-gray-500 mr-2"></span>
          <input type="text" class="${inputClass} bg-white border border-gray-300 rounded px-4 py-2" placeholder="" />
          <button class="remove-item text-gray-700 px-2">×</button>
        `;
        section.appendChild(newItem);

        // 番号を更新
        updateNumbers(section);
      } else if (e.target.classList.contains("remove-item")) {
        // 入力欄を削除
        const items = section.querySelectorAll(".item");
        if (items.length > 1) {
          e.target.parentElement.remove();
          updateNumbers(section);
        }
      }
    });

    // 初期状態で番号を設定
    updateNumbers(section);
  });
});
