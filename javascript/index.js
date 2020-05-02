const prompt = require("prompt");
const Robot = require("./robot");
const r = new Robot();

(function p() {
  prompt.get(["command"], (err, result) => {
    const n = result.command.toLowerCase().split(" ");
    const command = n[0];
    const args = n[1] ? n[1].split(",").map((v) => parseInt(v) || v) : [];

    if (["left", "right"].includes(command)) r.rotate(command);
    if (typeof r[command] === "function") r[command](args);
    if (command === "report") console.log(`${r.x},${r.y},${r.f}`);
    if (command !== "exit") p();
  });
})();
