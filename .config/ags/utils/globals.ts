import Variable from "astal/variable";

export const globalMousePos = Variable([0, 0]);

globalThis["globalMousePos"] = globalMousePos;
