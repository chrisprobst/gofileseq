#ifndef FILESEQ_FRAMESET_P_H_
#define FILESEQ_FRAMESET_P_H_

#include "../frameset.h"
#include "../ranges/ranges.h"

#include <string>
#include <utility>
#include <vector>

namespace fileseq {

namespace internal {


// Data structure holding information
// about a frame range
class FrameSetData {

public:
    FrameSetData() : frameRange(), ranges() {}

    explicit FrameSetData(std::string range)
        : frameRange(std::move(range))
        , ranges() {}

    std::string frameRange;
    Ranges ranges;
};


// Data structure holding information about
// the parsed data from a range string
struct RangePatternMatch { ;

    int matches;
    Frame start;
    Frame end;
    std::string stepMod;
    long step;
};

// Regular expression patterns for matching frame set strings.
// Examples:
//     1-100
//     100
//     1-100x5
bool getRangePatternMatch(RangePatternMatch &match, const std::string &range);


typedef std::vector< RangePatternMatch > RangeMatches;

// frameRangeMatches breaks down the string frame range
// into groups of range matches, for further processing.
Status frameRangeMatches(RangeMatches &matches, std::string range);


// Left pads a string to a given with, using "0".
// If the string begins with a negative "-" character, then
// padding is inserted between the "-" and the remaining characters.
std::string zfill(const std::string &src, int z);

// Left pads an int to a given with, using "0".
// If the string begins with a negative "-" character, then
// padding is inserted between the "-" and the remaining characters.
std::string zfill(Frame value, int z);


// Return whether a string component from a frame
// range string is a valid modifier symbol
bool isRangeModifier(const std::string &s);


} // internal

} // fileseq

#endif // FILESEQ_FRAMESET_P_H_
