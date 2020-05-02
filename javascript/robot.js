const XY = [0, 1, 2, 3, 4];
const F = ["north", "east", "south", "west"];

class Robot {
  place(a) {
    if (a.length === 3 && [XY, XY, F].every((v, i) => v.includes(a[i])))
      (this.x = a[0]), (this.y = a[1]), (this.f = a[2]);
  }

  move() {
    const axis = ["north", "south"].includes(this.f) ? "y" : "x";
    const nextVal = this[axis] + (["north", "east"].includes(this.f) ? 1 : -1);
    if (XY.includes(nextVal)) this[axis] = nextVal;
  }

  rotate(dir) {
    const nextIndex = F.indexOf(this.f) + (dir === "left" ? -1 : 1);
    if (this.f) this.f = F[nextIndex] || F[dir === "left" ? 3 : 0];
  }
}

module.exports = Robot;
