module.exports = function (model, io, client) {
	require('./comman/index.js')(model, io, client);
	require('./chat/index.js')(model, io, client);
	require('./roulette_custom/index.js')(model, io, client);
}
