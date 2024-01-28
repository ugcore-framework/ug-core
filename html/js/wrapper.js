(() => {
    let UGWrapper = { };
    UGWrapper.MessageSize = 1024;
    UGWrapper.messageId = 0;

    window.SendMessage = function (namespace, type, msg) {
        UGWrapper.messageId = UGWrapper.messageId < 65535 ? UGWrapper.messageId + 1 : 0;
        const str = JSON.stringify(msg);

        for (let i = 0; i < str.length; i++) {
            let count = 0;
            let chunk = "";

            while (count < UGWrapper.MessageSize && i < str.length) {
                chunk += str[i];

                count++;
                i++;
            }

            i--;

            const data = {
                __type: type,
                id: UGWrapper.messageId,
                chunk: chunk,
            };

            if (i === str.length - 1) data.end = true;

            $.post("https://" + namespace + "/__chunk", JSON.stringify(data));
        }
    };
})();