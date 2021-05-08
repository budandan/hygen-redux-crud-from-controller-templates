---
to: src/store/reducers/index.ts
inject: true
prepend: true
skip_if: import <%= model %> from './<%= model %>s'
---
import <%= model %> from './<%= model %>s';