export const fetchUnits = () => (
  $.ajax({
    method: 'GET',
    url: '/api/units'
  })
);

export const fetchUnit = id => (
  $.ajax({
    method: 'GET',
    url: `/api/units/${id}`
  })
);
