export const fetchLessons = () => (
  $.ajax({
    method: 'GET',
    url: '/api/lessons'
  })
);

export const fetchLesson = id => (
  $.ajax({
    method: 'GET',
    url: `/api/lessons/${id}`,
  })
);
