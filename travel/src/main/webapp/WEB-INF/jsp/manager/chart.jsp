<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script language="JavaScript" src="chart.js">
/* var list = new Array(); 
<c:forEach items="${cate}" var="list">
	 list.push("${list.count}");
	  </c:forEach>
console.log(list); */
//Create the chart
Highcharts.chart('containers',
		{
  chart: {
    type: 'column'
  },
  title: {
    text: '<span style="font-size: 1.5rem;">카테별 글 등록수</span>'
  },
  xAxis: {
    type: 'category'
  },
  yAxis: {
    title: {
      text: 'Total'
    }

  },
  legend: {
    enabled: false
  },
  plotOptions: {
    series: {
      borderWidth: 0,
      dataLabels: {
        enabled: true,
        format: '{point.y:.1f}%'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  series: [
    {
      name: "카테고리",
      colorByPoint: true,
      data: [
        {
          name: "먹방",
          y: 22,
          drilldown: "먹방"
        },
        {
          name: "관광지",
          y: 7.23,
          drilldown: "Firefox"
        },
        {
          name: "문화재/역사",
          y: 7.23,
          drilldown: "Internet Explorer"
        },
        {
          name: "호캉스",
          y: 5.58,
          drilldown: "Safari"
        },
        {
          name: "액티비티",
          y: 4.02,
          drilldown: "Edge"
        }
      ]
    }
  ],
  drilldown: {
    series: [
      {
        name: "먹방",
        id: "먹방",
        data: [
          [
            "1월",
            0.1
          ],
          [
            "2월",
            1.3
          ],
          [
            "3월",
            53.02
          ],
          [
            "4월",
            1.4
          ],
          [
            "5월",
            0.88
          ],
          [
            "6월",
            0.56
          ],
          [
            "7월",
            0.45
          ],
          [
            "8월",
            0.49
          ],
          [
            "9월",
            0.32
          ],
          [
            "10월",
            0.29
          ],
          [
            "11월",
            0.79
          ],
          [
            "12월",
            0.26
          ]
        ]
      },
      {
        name: "Firefox",
        id: "Firefox",
        data: [
            [
              "1월",
              0.1
            ],
            [
              "2월",
              1.3
            ],
            [
              "3월",
              53.02
            ],
            [
              "4월",
              1.4
            ],
            [
              "5월",
              0.88
            ],
            [
              "6월",
              0.56
            ],
            [
              "7월",
              0.45
            ],
            [
              "8월",
              0.49
            ],
            [
              "9월",
              0.32
            ],
            [
              "10월",
              0.29
            ],
            [
              "11월",
              0.79
            ],
            [
              "12월",
              0.26
            ]
          ]
      },
      {
        name: "Internet Explorer",
        id: "Internet Explorer",
        data: [
            [
              "1월",
              0.1
            ],
            [
              "2월",
              1.3
            ],
            [
              "3월",
              53.02
            ],
            [
              "4월",
              1.4
            ],
            [
              "5월",
              0.88
            ],
            [
              "6월",
              0.56
            ],
            [
              "7월",
              0.45
            ],
            [
              "8월",
              0.49
            ],
            [
              "9월",
              0.32
            ],
            [
              "10월",
              0.29
            ],
            [
              "11월",
              0.79
            ],
            [
              "12월",
              0.26
            ]
          ]
      },
      {
        name: "Safari",
        id: "Safari",
        data: [
            [
              "1월",
              0.1
            ],
            [
              "2월",
              1.3
            ],
            [
              "3월",
              53.02
            ],
            [
              "4월",
              1.4
            ],
            [
              "5월",
              0.88
            ],
            [
              "6월",
              0.56
            ],
            [
              "7월",
              0.45
            ],
            [
              "8월",
              0.49
            ],
            [
              "9월",
              0.32
            ],
            [
              "10월",
              0.29
            ],
            [
              "11월",
              0.79
            ],
            [
              "12월",
              0.26
            ]
          ]
      },
      {
        name: "Edge",
        id: "Edge",
        data: [
            [
                "v65.0",
                0.1
              ],
              [
                "v64.0",
                1.3
              ],
              [
                "v63.0",
                53.02
              ],
              [
                "v62.0",
                1.4
              ],
              [
                "v61.0",
                0.88
              ],
              [
                "v60.0",
                0.56
              ],
              [
                "v59.0",
                0.45
              ],
              [
                "v58.0",
                0.49
              ],
              [
                "v57.0",
                0.32
              ],
              [
                "v56.0",
                0.29
              ],
              [
                "v55.0",
                0.79
              ],
              [
                "v29.0",
                0.26
              ]
            ]
      }
    ]
  }
});</script>