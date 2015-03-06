---
---

require ['historyview'], (HistoryView) ->
    
    ################ Merge
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'a606312', parent: 'e137e9b', tags: ['autre']} ]
    ).render (d3.select '#merge')
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                      {id: 'a330b10', parent: 'e137e9b'},
                      {id: 'a606312', parent: 'e137e9b', tags: ['autre']},
                      {id: '591e02f', parent: 'a330b10', parent2: 'a606312', tags: ['master']} ]
    ).render (d3.select '#merge-right')
    (new HistoryView
        height: 300
        baseLine: 0.7
        currentBranch: 'autre'
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'a606312', parent: 'e137e9b'},
                {id: '591e02f', parent2: 'a606312', parent: 'a330b10', tags: ['autre']} ]
    ).render (d3.select '#merge-wrong-1')
    (new HistoryView
        height: 300
        baseLine: 0.6
        commitData: [ {id: 'e137e9b'},
            {id: 'a330b10', parent: 'e137e9b'},
            {id: 'a606312', parent: 'e137e9b'},
            {id: '591e02f', parent2: 'a606312', parent: 'a330b10', tags: ['autre', 'master']} ]
    ).render (d3.select '#merge-wrong-2')

    ################ Merge
    (new HistoryView
        height: 300
        baseLine: 0.7
        currentBranch: 'autre'
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'a606312', parent: 'e137e9b', tags: ['autre']} ]
    ).render (d3.select '#branch')
    (new HistoryView
        height: 300
        baseLine: 0.8
        currentBranch: 'autre'
        commitData: [ {id: 'e137e9b'},
                    {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                    {id: 'a606312', parent: 'e137e9b', tags: ['autre', 'dev']} ]
    ).render (d3.select '#branch-right')
    (new HistoryView
        height: 330
        baseLine: 0.6
        currentBranch: 'dev'
        commitData: [ {id: 'e137e9b'},
                    {id: 'a330b10', parent: 'e137e9b', tags: ['master', 'dev']},
                    {id: 'a606312', parent: 'e137e9b', tags: ['autre']} ]
    ).render (d3.select '#branch-wrong-1')
    (new HistoryView
        height: 400
        baseLine: 0.6
        currentBranch: 'dev'
        commitData: [ {id: 'e137e9b'},
                    {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                    {id: '91fab00', parent: 'e137e9b', tags: ['dev']},
                    {id: 'a606312', parent: 'e137e9b', tags: ['autre']}, ]
    ).render (d3.select '#branch-wrong-2')

    ################ Pull --ff-only
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['origin/master']}  ]
    ).render (d3.select '#ff-only')

    ################ Pull
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['origin/master']}  ]
    ).render (d3.select '#pull-1')
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['origin/master']},
                {id: '6093f21', parent: 'a330b10', parent2: 'b01d3f1', tags: ['master']} ]
    ).render (d3.select '#pull-2')

    ################ Checkout
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']}  ]
    ).render (d3.select '#checkout')
    (new HistoryView
        height: 300
        baseLine: 0.7
        currentBranch: 'dev'
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']} ]
    ).render (d3.select '#checkout-right')
    (new HistoryView
        height: 300
        baseLine: 0.7
        currentBranch: 'dev'
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']},
                {id: '6093f21', parent: 'a330b10', parent2: 'b01d3f1', tags: ['master']} ]
    ).render (d3.select '#checkout-wrong-1')
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']},
                {id: '6093f21', parent: 'a330b10', parent2: 'b01d3f1', tags: ['master']} ]
    ).render (d3.select '#checkout-wrong-2')

    ################ Reset
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']}  ]
    ).render (d3.select '#reset')
    (new HistoryView
        height: 300
        baseLine: 0.8
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['master', 'dev']} ]
    ).render (d3.select '#reset-right')
    (new HistoryView
        height: 300
        baseLine: 0.7
        currentBranch: 'dev'
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']} ]
    ).render (d3.select '#reset-wrong-1')
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['dev']},
                {id: '6093f21', parent: 'a330b10', parent2: 'b01d3f1', tags: ['master']} ]
    ).render (d3.select '#reset-wrong-2')

    ################ Status
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: '647f01a', parent: 'e137e9b', tags: ['dev']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['master']},
                {id: 'a330b10', parent: 'b01d3f1'},
                {id: '719dd1a', parent: 'a330b10', tags: ['origin/master']} ]
    ).render (d3.select '#status-right')
    (new HistoryView
        height: 300
        baseLine: 0.7
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['origin/master']} ]
    ).render (d3.select '#status-wrong-1')
    (new HistoryView
        height: 200
        baseLine: 0.5
        commitData: [ {id: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b', tags: ['origin/master']},
                {id: 'b01d3f1', parent: 'a330b10'},
                {id: '6093f21', parent: 'b01d3f1', tags: ['master']} ]
    ).render (d3.select '#status-wrong-2')

    ################ Rebase
    (new HistoryView
        height: 400
        baseLine: 0.6
        commitData: [ {id: 'e137e9b'},
                {id: '647f01a', parent: 'e137e9b', tags: ['dev']},
                {id: 'b01d3f1', parent: 'e137e9b', tags: ['master']},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: '719dd1a', parent: 'a330b10', tags: ['origin/master']} ]
    ).render (d3.select '#rebase')
    (new HistoryView
        height: 400
        baseLine: 0.5
        commitData: [ {id: 'e137e9b'},
                {id: '647f01a', parent: 'e137e9b', tags: ['dev']},
                {id: 'b01d3f1', parent: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: '719dd1a', parent: 'a330b10', tags: ['origin/master']},
                {id: '71d01af', parent: '719dd1a', tags: ['master']} ]
    ).render (d3.select '#rebase-right')
    (new HistoryView
        height: 400
        baseLine: 0.5
        commitData: [ {id: 'e137e9b'},
                {id: '647f01a', parent: 'e137e9b', tags: ['dev']},
                {id: 'b01d3f1', parent: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: '719dd1a', parent: 'a330b10', tags: ['origin/master']},
                {id: '71d01af', parent: '719dd1a', parent2: 'e137e9b', tags: ['master']} ]
    ).render (d3.select '#rebase-wrong-1')
    (new HistoryView
        height: 400
        baseLine: 0.45
        commitData: [ {id: 'e137e9b'},
                {id: '647f01a', parent: 'e137e9b', tags: ['dev']},
                {id: 'b01d3f1', parent: 'e137e9b'},
                {id: 'a330b10', parent: 'e137e9b'},
                {id: '719dd1a', parent: 'a330b10', tags: ['origin/master', 'master']} ]
    ).render (d3.select '#rebase-wrong-2')

($$ '.choice > *').forEach (c) ->
    c.on 'click', (e) ->
        cs = c.parentElement
        if not cs.dataset['score']
            if cs.dataset['choice']
                cs.children[Number cs.dataset['choice'] - 1].dataset['score'] = cs.dataset['choiceScore']
            cs.dataset['score'] = c.dataset['score'] || 0
            c.classList.add 'clicked'

        score = Array.reduce ($$ '.choice[data-score]'), ( (x, y) ->
            x + Number y.dataset['score'] ), 0
        ($$ '.score').forEach (x) ->
            x.textContent = score
