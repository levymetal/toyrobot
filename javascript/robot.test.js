const Robot = require("./robot");

describe("Robot", () => {
  let r = new Robot();
  let x, y, f;

  const report = () => `${r.x},${r.y},${r.f}`;

  beforeEach(() => {
    x = 2;
    y = 2;
    f = "north";
  });

  describe("place", () => {
    const place = () => {
      r.place([x, y, f]);
      return report();
    };

    test("with invalid x", () => {
      x = 5;
      expect(place()).toEqual("undefined,undefined,undefined");
    });

    test("with invalid y", () => {
      y = 5;
      expect(place()).toEqual("undefined,undefined,undefined");
    });

    test("with invalid f", () => {
      f = 5;
      expect(place()).toEqual("undefined,undefined,undefined");
    });

    test("with valid arguments", () => {
      expect(place()).toEqual("2,2,north");
    });
  });

  describe("move", () => {
    const move = () => {
      r.place([x, y, f]);
      r.move();
      return report();
    };

    describe("facing north", () => {
      test("within bounds", () => {
        expect(move()).toEqual("2,3,north");
      });

      test("out of bounds", () => {
        y = 4;
        expect(move()).toEqual("2,4,north");
      });
    });

    describe("facing south", () => {
      beforeEach(() => {
        f = "south";
      });

      test("within bounds", () => {
        expect(move()).toEqual("2,1,south");
      });

      test("out of bounds", () => {
        y = 0;
        expect(move()).toEqual("2,0,south");
      });
    });

    describe("facing east", () => {
      beforeEach(() => {
        f = "east";
      });

      test("within bounds", () => {
        expect(move()).toEqual("3,2,east");
      });

      test("out of bounds", () => {
        x = 4;
        expect(move()).toEqual("4,2,east");
      });
    });

    describe("facing west", () => {
      beforeEach(() => {
        f = "west";
      });

      test("within bounds", () => {
        expect(move()).toEqual("1,2,west");
      });

      test("out of bounds", () => {
        x = 0;
        expect(move()).toEqual("0,2,west");
      });
    });
  });

  describe("rotate", () => {
    let direction;

    const rotate = () => {
      r.place([x, y, f]);
      r.rotate(direction);
      return report();
    };

    describe("left", () => {
      beforeEach(() => {
        direction = "left";
      });

      test("facing north", () => {
        expect(rotate()).toEqual("2,2,west");
      });

      test("facing south", () => {
        f = "south";
        expect(rotate()).toEqual("2,2,east");
      });

      test("facing east", () => {
        f = "east";
        expect(rotate()).toEqual("2,2,north");
      });

      test("facing west", () => {
        f = "west";
        expect(rotate()).toEqual("2,2,south");
      });
    });

    describe("right", () => {
      beforeEach(() => {
        direction = "right";
      });

      test("facing north", () => {
        expect(rotate()).toEqual("2,2,east");
      });

      test("facing south", () => {
        f = "south";
        expect(rotate()).toEqual("2,2,west");
      });

      test("facing east", () => {
        f = "east";
        expect(rotate()).toEqual("2,2,south");
      });

      test("facing west", () => {
        f = "west";
        expect(rotate()).toEqual("2,2,north");
      });
    });
  });
});
