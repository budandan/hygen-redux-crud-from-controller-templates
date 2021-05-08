---
to: src/store/reducers/<%= file %>.ts
unless_exists: true
---
import { <%= h.changeCase.title(model) %> } from '../../models';
import { Action } from './index';
import {
	GET_<%= h.changeCase.constant(model) %>S_REQUEST,
	GET_<%= h.changeCase.constant(model) %>S_SUCCESS,
	GET_<%= h.changeCase.constant(model) %>S_FAILURE,
	GET_<%= h.changeCase.constant(model) %>_BY_ID_REQUEST,
	GET_<%= h.changeCase.constant(model) %>_BY_ID_SUCCESS,
	GET_<%= h.changeCase.constant(model) %>_BY_ID_FAILURE,
	PATCH_<%= h.changeCase.constant(model) %>_REQUEST,
	PATCH_<%= h.changeCase.constant(model) %>_SUCCESS,
	PATCH_<%= h.changeCase.constant(model) %>_FAILURE,
} from '../action-creators/<%= model %>s';

export interface <%= h.changeCase.title(model) %>Store {
	<%= model %>s?: <%= h.changeCase.title(model) %>[];
	selected<%= h.changeCase.title(model) %>?: <%= h.changeCase.title(model) %>;
	loading: boolean;
}

const initialState: <%= h.changeCase.title(model) %>Store = {
	<%= model %>s: undefined,
	selected<%= h.changeCase.title(model) %>: undefined,
	loading: false,
};

const <%= h.changeCase.title(model) %>Reducer = (state = initialState, action: Action) => {
	const { type, payload } = action;

	switch (type) {
		case GET_<%= h.changeCase.constant(model) %>S_REQUEST:
			return {
				...state,
				loading: true,
			};
		case GET_<%= h.changeCase.constant(model) %>S_SUCCESS:
			return {
				...state,
				<%= model %>s: payload,
				loading: false,
			};
		case GET_<%= h.changeCase.constant(model) %>S_FAILURE:
			return {
				...state,
				loading: false,
			};
		case GET_<%= h.changeCase.constant(model) %>_BY_ID_REQUEST:
			return {
				...state,
				loading: true,
				selected<%= h.changeCase.title(model) %>: undefined,
			};
		case GET_<%= h.changeCase.constant(model) %>_BY_ID_SUCCESS:
			return {
				...state,
				selected<%= h.changeCase.title(model) %>: payload,
				loading: false,
			};
		case GET_<%= h.changeCase.constant(model) %>_BY_ID_FAILURE:
			return {
				...state,
				loading: false,
			};
		case PATCH_<%= h.changeCase.constant(model) %>_REQUEST:
			return {
				...state,
				loading: true,
			};
		case PATCH_<%= h.changeCase.constant(model) %>_SUCCESS:
			return {
				...state,
				<%= model %>s:
					state.<%= model %>s &&
					(!state.<%= model %>s.find((<%= model %>) => <%= model %>.id === payload.id)
						? [...state.<%= model %>s, payload] // POST
						: state.<%= model %>s.map((<%= model %>) => (<%= model %>.id === payload.id ? payload : <%= model %>))), // PUT,
				loading: false,
			};
		case PATCH_<%= h.changeCase.constant(model) %>_FAILURE:
			return {
				...state,
				loading: false,
			};
		default:
			return state;
	}
};

export default <%= h.changeCase.title(model) %>Reducer;