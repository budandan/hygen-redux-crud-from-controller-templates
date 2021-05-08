---
to: src/services/<%= model %>Service.ts
unless_exists: true
---
import { <%= h.changeCase.title(model) %> } from '../models';
import { http } from '../utils/http';

const ENDPOINT = '<%= h.changeCase.title(model) %>s';

export const get<%= h.changeCase.title(model) %>s = async (): Promise<<%= h.changeCase.title(model) %>[]> => {
	const { data: <%= model %>s } = await http.get<<%= h.changeCase.title(model) %>[]>(`${ENDPOINT}`);
	return <%= model %>s;
};

export const get<%= h.changeCase.title(model) %>ById = async (<%= model %>Id: string): Promise<<%= h.changeCase.title(model) %>> => {
	const { data: <%= model %> } = await http.get<<%= h.changeCase.title(model) %>>(`${ENDPOINT}/${<%= model %>Id}`);
	return <%= model %>;
};

export const patch<%= h.changeCase.title(model) %> = async (body: <%= h.changeCase.title(model) %>): Promise<<%= h.changeCase.title(model) %>> => {
	const { data: <%= model %> } = await http.patch<<%= h.changeCase.title(model) %>>(`${ENDPOINT}`, body);
	return <%= model %>;
};