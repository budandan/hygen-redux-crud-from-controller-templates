---
to: src/store/action-creators/<%= file %>.ts
unless_exists: true
---
import { <%= h.changeCase.title(model) %> } from '../../models';

export const GET_<%= h.changeCase.constant(model) %>S_REQUEST = 'GET_<%= h.changeCase.constant(model) %>S_REQUEST';
export const get<%= h.changeCase.title(model) %>sRequest = () => ({ type: GET_<%= h.changeCase.constant(model) %>S_REQUEST });

export const GET_<%= h.changeCase.constant(model) %>S_SUCCESS = 'GET_<%= h.changeCase.constant(model) %>S_SUCCESS';
export const get<%= h.changeCase.title(model) %>sSuccess = (<%= model %>s: <%= h.changeCase.title(model) %>[]) => ({ 
    type: GET_<%= h.changeCase.constant(model) %>S_SUCCESS, 
    payload: <%= model %>s 
});

export const GET_<%= h.changeCase.constant(model) %>S_FAILURE = 'GET_<%= h.changeCase.constant(model) %>S_FAILURE';
export const get<%= h.changeCase.title(model) %>sFailure = () => ({ type: GET_<%= h.changeCase.constant(model) %>S_FAILURE });

export const GET_<%= h.changeCase.constant(model) %>_BY_ID_REQUEST = 'GET_<%= h.changeCase.constant(model) %>_BY_ID_REQUEST';
export const get<%= h.changeCase.title(model) %>ByIdRequest = () => ({ type: GET_<%= h.changeCase.constant(model) %>_BY_ID_REQUEST });

export const GET_<%= h.changeCase.constant(model) %>_BY_ID_SUCCESS = 'GET_<%= h.changeCase.constant(model) %>_BY_ID_SUCCESS';
export const get<%= h.changeCase.title(model) %>ByIdSuccess = (<%= model %>: <%= h.changeCase.title(model) %>) => ({
	type: GET_<%= h.changeCase.constant(model) %>_BY_ID_SUCCESS,
	payload: <%= model %>,
});

export const GET_<%= h.changeCase.constant(model) %>_BY_ID_FAILURE = 'GET_<%= h.changeCase.constant(model) %>_BY_ID_FAILURE';
export const get<%= h.changeCase.title(model) %>ByIdFailure = () => ({ type: GET_<%= h.changeCase.constant(model) %>_BY_ID_FAILURE });

export const PATCH_<%= h.changeCase.constant(model) %>_REQUEST = 'PATCH_<%= h.changeCase.constant(model) %>_REQUEST';
export const patch<%= h.changeCase.title(model) %>Request = () => ({ type: PATCH_<%= h.changeCase.constant(model) %>_REQUEST });

export const PATCH_<%= h.changeCase.constant(model) %>_SUCCESS = 'PATCH_<%= h.changeCase.constant(model) %>_SUCCESS';
export const patch<%= h.changeCase.title(model) %>Success = (<%= model %>: <%= h.changeCase.title(model) %>) => ({
	type: PATCH_<%= h.changeCase.constant(model) %>_SUCCESS,
	payload: <%= model %>,
});

export const PATCH_<%= h.changeCase.constant(model) %>_FAILURE = 'PATCH_<%= h.changeCase.constant(model) %>_FAILURE';
export const patch<%= h.changeCase.title(model) %>Failure = () => ({ type: PATCH_<%= h.changeCase.constant(model) %>_FAILURE });
