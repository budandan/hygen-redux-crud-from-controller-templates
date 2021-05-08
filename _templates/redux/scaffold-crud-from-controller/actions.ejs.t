---
to: src/store/actions/<%= file %>.ts
unless_exists: true
---
import {
	get<%= h.changeCase.title(model) %>sRequest,
	get<%= h.changeCase.title(model) %>sSuccess,
	get<%= h.changeCase.title(model) %>sFailure,
	get<%= h.changeCase.title(model) %>ByIdRequest,
	get<%= h.changeCase.title(model) %>ByIdFailure,
	get<%= h.changeCase.title(model) %>ByIdSuccess,
	patch<%= h.changeCase.title(model) %>Request,
	patch<%= h.changeCase.title(model) %>Success,
	patch<%= h.changeCase.title(model) %>Failure,
} from '../action-creators/<%= model %>s';
import * as <%= model %>Service from '../../services/<%= model %>Service';
import { Dispatch } from 'redux';
import { enqueueSnackbar } from '../action-creators/snackbar';
import { DismissibleSnackbar, SnackbarType } from '../../models/snackbar';
import { <%= h.changeCase.title(model) %> } from '../../models';

export const tryGet<%= h.changeCase.title(model) %>s = () => async (dispatch: Dispatch) => {
	try {
		dispatch(get<%= h.changeCase.title(model) %>sRequest());
		const <%= model %>s = await <%= model %>Service.get<%= h.changeCase.title(model) %>s();
		dispatch(get<%= h.changeCase.title(model) %>sSuccess(<%= model %>s));
	} catch (err) {
		console.error(err);
		dispatch(get<%= h.changeCase.title(model) %>sFailure());
		dispatch(enqueueSnackbar(new DismissibleSnackbar('Could not get <%= h.changeCase.title(model) %>s', SnackbarType.Error)));
	}
};

export const tryGet<%= h.changeCase.title(model) %>ById = (id: string) => async (dispatch: Dispatch) => {
	try {
		dispatch(get<%= h.changeCase.title(model) %>ByIdRequest());
		const <%= model %> = await <%= model %>Service.get<%= h.changeCase.title(model) %>ById(id);
		dispatch(get<%= h.changeCase.title(model) %>ByIdSuccess(<%= model %>));
	} catch (err) {
		console.error(err);
		dispatch(get<%= h.changeCase.title(model) %>ByIdFailure());
		dispatch(enqueueSnackbar(new DismissibleSnackbar('Could not get <%= h.changeCase.title(model) %>s.', SnackbarType.Error)));
	}
};

export const tryPatch<%= h.changeCase.title(model) %> = (body: <%= h.changeCase.title(model) %>) => async (dispatch: Dispatch) => {
	const action: string = body.id ? 'update' : 'create';
	try {
		dispatch(patch<%= h.changeCase.title(model) %>Request());
		const <%= model %> = await <%= model %>Service.patch<%= h.changeCase.title(model) %>(body);
		dispatch(patch<%= h.changeCase.title(model) %>Success(body));
		dispatch(enqueueSnackbar(new DismissibleSnackbar(`<%= h.changeCase.title(model) %> ${action}d.`, SnackbarType.Success)));
		return <%= model %>;
	} catch (err) {
		console.error(err);
		dispatch(patch<%= h.changeCase.title(model) %>Failure());
		dispatch(enqueueSnackbar(new DismissibleSnackbar(`Could not ${action} <%= h.changeCase.title(model) %>.`, SnackbarType.Error)));
	}
};
