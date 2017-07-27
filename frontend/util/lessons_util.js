// export const fetchLessons = () => (
//   $.ajax({
//     method: 'GET',
//     url: '/api/lessons'
//   })
// );

export const fetchLesson = id => (
  $.ajax({
    method: 'GET',
    url: `/api/lessons/${id}`,
  })
);

export const updateCurrentLesson = id => (
  $.ajax({
    method: 'POST',
    url: `/api/users/${id}`, //??? HOW to access current user????
  })
);
