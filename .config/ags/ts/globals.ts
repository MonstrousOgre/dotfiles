import { getOptions } from "./utils/utils";

export const options = getOptions();

export const globalMousePos = Variable([0, 0]);

globalThis["globalMousePos"] = globalMousePos;
