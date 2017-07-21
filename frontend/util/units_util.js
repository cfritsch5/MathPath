export const fetchUnits = () => (
  $.ajax({
    method: 'GET',
    url: '/api/units'
  })
);

export const fetchTodo = id => (
  $.ajax({
    method: 'GET',
    url: `/api/todos/${id}`,
  })
);
