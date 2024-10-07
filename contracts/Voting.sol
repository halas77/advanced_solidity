// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//  -- Gas optimization strategies --  //

// Minimizing storage reads and writes
// Using smaller data types and packing them together
// Optimizing loops and control flow
// minimize external function calls
// Avoiding unnecessary operations

contract Voting {
    struct Candidate {
        uint8 voteCount;  //
    }

    mapping(address => bool) public hasVoted;
    mapping(uint8 => Candidate) public candidates;
    uint8 public candidateCount; 

    function addCandidate() public {
        candidateCount++;
    }

    function vote(uint8 _candidateIndex) public {
        require(!hasVoted[msg.sender], "Already voted.");
        require(_candidateIndex < candidateCount, "Invalid candidate.");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getVoteCount(uint8 _candidateIndex) public view returns (uint) {
        require(_candidateIndex < candidateCount, "Invalid candidate.");
        return candidates[_candidateIndex].voteCount;
    }
}
