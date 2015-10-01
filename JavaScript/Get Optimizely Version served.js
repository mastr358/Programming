var experimentID = window['optimizely'].data.state.activeExperiments[0];
var variationIndex = window['optimizely'].data.state.variationMap[experimentID];
var variationName = window['optimizely'].data.state.variationNamesMap[experimentID];
var variationID = window['optimizely'].data.state.variationIdsMap[experimentID];
variationName;