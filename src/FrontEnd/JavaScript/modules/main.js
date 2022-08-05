
// Default import
import person from "./person";
import pers from "./person"; // Can create a different name

// Named import
import { address } from "./company"; // Must have exact name
import { company } from "./company";
import { address as addr } from "./company"
import * as all from "./company"


console.log(pers.name)
console.log(company.name)
console.log(address)

console.log(addr);
console.log(all.address);
console.log(all.company.name);