pragma solidity >=0.4.22 < 0.7.0;

// 클래스 선언??
contract TMOCContract {
    uint total;
    struct myLib {
        uint no;
        string lib_element;
        string stride;
        string content;
        string url;
        string lib_writer;
	}
	struct myThreat {
        uint threat_number;
        string threat_element;
        string threat_detail;
        string threat_reason;
        string lib_number;
        string threat_writer;
    }
    struct myTree {
        string tree_number;
        string tree_hash;
        string tree_uploader;
    }
    struct myThreatScoring {
        string user_id;
        string threat_number;
        uint threat_score;
    }
    struct myLibraryScoring {
        string user_id;
        string lib_number;
        uint lib_score;
    }
    struct myTreeScoring {
        string user_id;
        string tree_number;
        uint tree_score;
    }
    struct myExchange {
        string points;
        string coins;
        string remaining;
    }

    // Declare the attack library event
    event sol_attacklibrary (
        uint no,
        string lib_element,
        string stride,
        string content,
        string url,
        string lib_writer
    );
    // Threat identification event declaration
    event sol_threat(
        uint threat_number,
        string threat_element,
        string threat_detail,
        string threat_reason,
        string lib_number,
        string threat_writer
    );
    // Declare the attack tree event
    event sol_tree(
        string tree_number,
        string tree_hash,
        string tree_uploader
    );
    // Threat score event declaration
    event sol_threatscore (
        string user_id,
        string threat_number,
        uint threat_score
    );
    // Declare library score event
    event sol_libscore (
        string user_id,
        string lib_number,
        uint lib_score
    );
    // Declare the attack tree score event
    event sol_treescore (
        string user_id,
        string tree_number,
        uint tree_score
    );
    // Point - Declare tmoc coin conversion event
    event sol_exchange (
        string points,
        string coins,
        string remaining
    );

    // Register and check the attack library
	myLib[] public librarys;
    
	/* Register the attack library entered by the user */
    function sol_addLibrary (uint _no, string memory _lib_element, string memory _stride, string memory _content, string memory _url, string memory _lib_writer) public {
        librarys.push(myLib(_no, _lib_element, _stride, _content, _url, _lib_writer));
        total++;
        emit sol_attacklibrary(_no, _lib_element, _stride, _content, _url, _lib_writer);
    }

    /* Returns the library corresponding to the number */
    function sol_getLibrary(uint _idx) public view returns (uint, string memory, string memory, string memory, string memory, string memory) {
        return (librarys[_idx].no, librarys[_idx].lib_element, librarys[_idx].stride, librarys[_idx].content, librarys[_idx].url, librarys[_idx].lib_writer);
    }


    // Register and check the threat
    myThreat[] public threats;

    /* Register the threat entered by the user */
    function sol_addThreat (uint _threat_number, string memory _threat_element, string memory _threat_detail, string memory _threat_reason, string memory _lib_number, string memory _threat_writer) public {   // modified from cks
        threats.push(myThreat(_threat_number, _threat_element, _threat_detail, _threat_reason, _lib_number, _threat_writer));   // modified from cks
        total++;
        emit sol_threat(_threat_number, _threat_element, _threat_detail, _threat_reason, _lib_number, _threat_writer);
    }

    /* Returns the threat corresponding to the number */
    function sol_getThreat(uint _idx) public view returns (uint, string memory, string memory, string memory, string memory, string memory) {
        return (threats[_idx].threat_number, threats[_idx].threat_element, threats[_idx].threat_detail, threats[_idx].threat_reason, threats[_idx].lib_number, threats[_idx].threat_writer);
    }


    // Register and check the attack tree
    myTree[] public trees;

    /* Register the attack tree entered by the user */
    function sol_addTree (string memory _tree_number, string memory _tree_hash, string memory _tree_uploader) public {
        trees.push(myTree(_tree_number, _tree_hash, _tree_uploader));
        total++;
        emit sol_tree(_tree_number, _tree_hash, _tree_uploader);
    }

    /* Return the attack tree corresponding to the number */
    function sol_getTree(uint _idx) public view returns (string memory, string memory, string memory) {
        return (trees[_idx].tree_number, trees[_idx].tree_hash, trees[_idx].tree_uploader);
    }

    // Threat Assessment
    myThreatScoring[] public threat_score;

    /* Register the threat score entered by the user */
    function sol_addThreatScore (string memory _user_id, string memory _threat_number, uint _threat_score) public {
        threat_score.push(myThreatScoring(_user_id, _threat_number, _threat_score));
        total++;
        emit sol_threatscore(_user_id, _threat_number, _threat_score);
    }

    // evaluate the library
    myLibraryScoring[] public lib_score;

    /* Register the library score entered by the user */
    function sol_addLibraryScore (string memory _user_id, string memory _lib_number, uint _lib_score) public {
        lib_score.push(myLibraryScoring(_user_id, _lib_number, _lib_score));
        total++;
        emit sol_libscore(_user_id, _lib_number, _lib_score);
    }

    // evaluate the attack tree
    myTreeScoring[] public tree_score;

    /* Register the attack tree score entered by the user */
    function sol_addTreeScore (string memory _user_id, string memory _tree_number, uint _tree_score) public {
        tree_score.push(myTreeScoring(_user_id, _tree_number, _tree_score));
        total++;
        emit sol_treescore(_user_id, _tree_number, _tree_score);
    }

    // Check the total number of transactions
    function sol_getTotal() public view returns (uint) {
        return total;
    }

    // Point - tmoc coin conversion
    myExchange[] public exchanges;

    /* Register point conversion information */
    function sol_addExchange (string memory _points, string memory _coins, string memory _remaining) public {
        exchanges.push(myTree(_points, _coins, _remaining));
        total++;
        emit sol_exchange(_points, _coins, _remaining);
    }

    /* Return the attack tree corresponding to the number */
    function sol_getExchange(uint _idx) public view returns (string memory, string memory, string memory) {
        return (exchanges[_idx].points, exchanges[_idx].coins, exchanges[_idx].remaining);
    }
}