window.onload = function() {

    const path = window.location.pathname

    if(path == '/quizzes') {
        const queries = window.location.search.substring(1).split('&')
        queries.forEach(function(query, _i, _array) {
            let key = query.split('=')[0]
            if(key == 'id') {
                const id = parseInt(query.split('=')[1])
                const top = document.querySelector('a[href="/quizzes/' + id + '/edit"]').getBoundingClientRect().top
                window.scrollTo(0, top)
            }
        })
    }
}
