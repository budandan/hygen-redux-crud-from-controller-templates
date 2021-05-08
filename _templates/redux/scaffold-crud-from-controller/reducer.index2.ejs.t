---
to: src/store/reducers/index.ts
inject: true
after: const rootReducer = combineReducers
skip_if: <%= model %>,
---
    <%= model %>,