<script type="text/javascript">
    (function(){
        var s   = document.createElement('script');
        var x   = document.getElementsByTagName('script')[0];
        s.type  = 'text/javascript';
        s.async = true;
        s.src   = ('https:'==document.location.protocol?'https://':'http://')
                + 'eu-sonar.sociomantic.com/js/2010-07-01/adpan/ringit-cz';
        x.parentNode.insertBefore( s, x );
    })();

if ("{{dl.visitorId}}" != "undefined" || "{{dl.mhash}}" != "undefined") {var customer = {}}
if ("{{dl.visitorId}}" != "undefined") {customer.identifier = "{{dl.visitorId}}"}      //if not undefined, fill visitorId into customer.identifier
if ("{{dl.mhash}}" != "undefined") {customer.mhash = "{{dl.mhash}}"}
</script>