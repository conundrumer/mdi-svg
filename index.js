// toPathString, toSvgString, toPath, toSvg

exports.toPathString = function (data) {
  return '<path d="' + data + '" />'
}

exports.toSvgString = function (data) {
  return '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">' +
    exports.toPathString(data) + '</svg>'
}

exports.toPath = function (React) {
  return function (data) {
    return function (props) {
      return React.createElement(
        'path',
        Object.assign({
          d: data
        }, props)
      )
    }
  }
}

exports.toSvg = function (React) {
  return function (data) {
    return function (props) {
      return React.createElement(
        'svg',
        Object.assign({
          width: 24,
          height: 24,
          viewBox: '0 0 24 24'
        }, props),
        React.createElement('path', { d: data })
      )
    }
  }
}
