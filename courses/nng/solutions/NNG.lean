/-
Root of the `nng` course library. Importing this builds the whole course
(foundation + every solution in dependency order), which is how CI verifies all
solutions compile. The tail of the import-chain is updated as worlds are added.
-/
import MyNatLib.Prelude
